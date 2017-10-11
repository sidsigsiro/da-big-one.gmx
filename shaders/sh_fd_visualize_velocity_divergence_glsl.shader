// Passthrough vertex shader.

attribute vec4 in_Position;
attribute vec2 in_TextureCoord;
attribute vec4 in_Colour;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * in_Position;
    v_vTexcoord = in_TextureCoord;
    v_vColour = in_Colour;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~#define FLOAT_16_OFFSET (128.0 / 255.0)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

float unpack_ufloat_16(vec2 data) {return data.x + (data.y / 255.0);}

void main() {
    float divergence = unpack_ufloat_16(texture2D(gm_BaseTexture, v_vTexcoord).zw) - FLOAT_16_OFFSET;
    gl_FragColor = v_vColour * vec4(vec3(divergence + FLOAT_16_OFFSET), 1.0);
}
