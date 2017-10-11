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
//######################_==_YOYO_SHADER_MARKER_==_######################@~#define colorize_color vec4(0.5, 0.5, 0.5, 1.0)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
    gl_FragColor = v_vColour * vec4(colorize_color.rgb, colorize_color.a * texture2D(gm_BaseTexture, v_vTexcoord).w);
}
