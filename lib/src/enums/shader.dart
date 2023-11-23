enum ShaderLocation {
  vertexPosition,
  vertexTexcoord01,
  vertexTexcoord02,
  vertexNormal,
  vertexTangent,
  vertexColor,
  matrixMVP,
  matrixView,
  matrixProjection,
  matrixModel,
  matrixNormal,
  vectorView,
  colorDiffuse,
  colorSpecular,
  colorAmbient,
  mapAlbedo,
  mapMetalness,
  mapNormal,
  mapRoughness,
  mapOcclusion,
  mapEmission,
  mapHeight,
  mapCubemap,
  mapIrradiance,
  mapPrefilter,
  mapBRDF,
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
