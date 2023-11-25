abstract final class ShaderLocationIndex {
  static const int vertexPosition = 0;
  static const int vertexTexcoord01 = 1;
  static const int vertexTexcoord02 = 2;
  static const int vertexNormal = 3;
  static const int vertexTangent = 4;
  static const int vertexColor = 5;
  static const int matrixMVP = 6;
  static const int matrixView = 7;
  static const int matrixProjection = 8;
  static const int matrixModel = 9;
  static const int matrixNormal = 10;
  static const int vectorView = 11;
  static const int colorDiffuse = 12;
  static const int colorSpecular = 13;
  static const int colorAmbient = 14;
  static const int mapAlbedo = 15;
  static const int mapMetalness = 16;
  static const int mapNormal = 17;
  static const int mapRoughness = 18;
  static const int mapOcclusion = 19;
  static const int mapEmission = 20;
  static const int mapHeight = 21;
  static const int mapCubemap = 22;
  static const int mapIrradiance = 23;
  static const int mapPrefilter = 24;
  static const int mapBRDF = 25;
}

enum ShaderUniformDataType {
  float(1),
  vec2(2),
  vec3(3),
  vec4(4),
  integer(1),
  ivec2(2),
  ivec3(3),
  ivec4(4),
  sampler2d(1);

  final int size;

  const ShaderUniformDataType(this.size);
}
