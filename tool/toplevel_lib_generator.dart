// ignore_for_file: avoid_print
import 'dart:io';

import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:args/args.dart';
import 'package:collection/collection.dart';
import 'package:dart_style/dart_style.dart';
import 'package:path/path.dart' as p;
import 'package:recase/recase.dart';

const String header = """
// GENERATED FILE: DO NOT EDIT
//
// Generated using "dart run ./tools/toplevel_lib_generator.dart generate"
""";

const List<String> requiredImports = [
  'dart:ffi',
  'dart:typed_data',
  'package:raylib/raylib.dart',
];

const Map<String, String> specialCasedModuleNames = {
  "managed/managed.dart": "_ManagedModule",
};

Future<void> main(List<String> args) async {
  final parser = ArgParser().addCommand("generate")
    ..addOption("source-dir", abbr: "s", defaultsTo: "lib/src/modules")
    ..addOption("output-file", abbr: "o", defaultsTo: "lib/src/toplevel.dart");

  final result = parser.parse(args);

  final source = Directory(result["source-dir"]! as String);
  final output = File(result["output-file"]! as String);

  final modules = source.listSync().whereType<Directory>();
  final parts = source
      .listSync(recursive: true)
      .whereType<File>()
      .where((e) => p.extension(e.path) == ".dart");
  final List<String> moduleParts = [];

  final analysisCollection = AnalysisContextCollection(
    includedPaths: parts.map((e) => p.normalize(e.absolute.path)).toList(),
  );

  for (final module in modules) {
    final moduleName = p.basename(module.path);
    final submodules =
        parts.where((e) => p.basename(e.parent.path) == moduleName);

    for (final part in submodules) {
      final partContent = <String>[];
      final partName = p.basenameWithoutExtension(part.path);
      final qualifiedModuleName = "$moduleName/$partName.dart";
      final expectedMixinName = specialCasedModuleNames[qualifiedModuleName] ??
          "_${moduleName.pascalCase}${partName.pascalCase}Module";

      partContent.add("/* ----- $qualifiedModuleName ----- */");

      final normalizedPath = p.normalize(part.absolute.path);
      final context = analysisCollection.contextFor(normalizedPath);
      final unit = await context.currentSession.getResolvedUnit(normalizedPath);
      if (unit is! ResolvedUnitResult) {
        print("WARNING: Couldn't get library for ${part.path}");
        continue;
      }

      final mixins =
          unit.libraryElement.topLevelElements.whereType<MixinElement>();
      final moduleMixin =
          mixins.firstWhereOrNull((e) => e.displayName == expectedMixinName);
      if (moduleMixin == null) {
        print(
          "WARNING: File ${part.path} didn't contain expected mixin $expectedMixinName",
        );
        continue;
      }

      print("Generating methods for ${p.normalize(part.path)}");

      for (final method in moduleMixin.methods) {
        final returnType = _formatType(method.returnType);
        final List<String> posParameters = [];
        final List<String> optionalParameters = [];
        final List<String> namedParameters = [];
        final List<String> arguments = [];

        for (final parameter in method.parameters) {
          final param =
              "${_formatType(parameter.type)} ${parameter.displayName}";
          switch (parameter) {
            case _ when parameter.isNamed:
              final namedParameter =
                  "${parameter.isRequiredNamed ? "required " : ""}$param${parameter.defaultValueCode != null ? " = ${parameter.defaultValueCode}" : ""}";
              namedParameters.add(namedParameter);
              arguments.add(
                "${parameter.displayName}: ${parameter.displayName}",
              );
            case _ when parameter.isOptionalPositional:
              final optionalParameter =
                  "$param${parameter.defaultValueCode != null ? " = ${parameter.defaultValueCode}" : ""}";
              optionalParameters.add(optionalParameter);
              arguments.add(parameter.displayName);
            case _ when parameter.isRequiredPositional:
              posParameters.add(param);
              arguments.add(parameter.displayName);
          }
        }

        if (namedParameters.isNotEmpty && optionalParameters.isNotEmpty) {
          print(
            "WARNING: Invalid state for argument for method ${method.displayName}",
          );
          continue;
        }

        final parameters = [
          if (posParameters.isNotEmpty) posParameters.join(", "),
          if (optionalParameters.isNotEmpty)
            "[${optionalParameters.join(", ")}]",
          if (namedParameters.isNotEmpty) "{${namedParameters.join(", ")}}",
        ];

        partContent.add(
          "$returnType ${method.displayName}(${parameters.join(", ")}) => zoneRayLib.${method.displayName}(${arguments.join(", ")});",
        );
      }

      moduleParts.add(
        [partContent.first, partContent.sublist(1).join("\n\n")].join("\n"),
      );
    }
  }

  final outputBuffer = StringBuffer();
  outputBuffer.writeln(header);

  for (final import in requiredImports) {
    outputBuffer.writeln("import '$import';");
  }

  outputBuffer.writeln();
  outputBuffer.write(moduleParts.join("\n\n"));

  final formatter = DartFormatter();
  final formatted = formatter.format(outputBuffer.toString());

  output.writeAsStringSync(formatted);
}

String _formatType(DartType type) {
  final List<String> typeArguments;
  final String name;

  if (type is RecordType && type.alias == null) {
    final positionalFields =
        type.positionalFields.map((e) => _formatType(e.type)).toList();
    final namedFields = type.namedFields
        .map((e) => "${_formatType(e.type)} ${e.name}")
        .toList();

    String formattedFields = [
      positionalFields.join(", "),
      "{${namedFields.join(", ")}}",
    ].join(", ");
    if (positionalFields.length == 1 && namedFields.isEmpty) {
      formattedFields += ",";
    }
    name = "($formattedFields)";
    typeArguments = [];
  } else if (type is ParameterizedType && type.alias == null) {
    name = type.element!.displayName;
    typeArguments = type.typeArguments.map(_formatType).toList();
  } else if (type.alias != null) {
    name = type.alias!.element.name;
    typeArguments = type.alias!.typeArguments.map(_formatType).toList();
  } else {
    name = type.getDisplayString(withNullability: true);
    typeArguments = [];
  }
  final bool isNullable = type.nullabilitySuffix == NullabilitySuffix.question;

  return "$name${typeArguments.isNotEmpty ? "<${typeArguments.join(", ")}>" : ""}${isNullable ? "?" : ""}";
}
