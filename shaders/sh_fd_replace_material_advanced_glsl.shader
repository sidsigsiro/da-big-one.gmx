attribute vec4 in_Position;
attribute vec2 in_TextureCoord;
attribute vec4 in_Colour;

varying vec2 v_vTexcoord;
varying vec2 v_vScreencoord;
varying vec4 color;

uniform vec2 addend;

void main() {
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * in_Position;
    v_vTexcoord = in_TextureCoord;
    v_vScreencoord = gl_Position.xy * vec2(0.5, -0.5) + addend;
    color = in_Colour;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec2 v_vScreencoord;
varying vec4 color;

uniform sampler2D texture_material_0;

void main() {
    vec4 destination = texture2D(texture_material_0, v_vScreencoord);
    vec4 source = color * texture2D(gm_BaseTexture, v_vTexcoord);
    gl_FragColor = source * vec4(source.aaa, 1.0) + destination * (1.0 - source.aaaa);
}
