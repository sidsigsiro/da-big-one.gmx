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
//######################_==_YOYO_SHADER_MARKER_==_######################@~#define FLOAT_16_OFFSET (128.0 / 255.0)

varying vec2 v_vTexcoord;
varying vec2 v_vScreencoord;
varying vec4 color;

uniform sampler2D texture_velocity;

vec2 unpack_uvec2_16(vec4 data) {return vec2(data.xy + (data.zw / 255.0));}
vec4 pack_uvec2_16(vec2 data) {return vec4(floor(data * 255.0) / 255.0, fract(data * 255.0));}

void main() {
    float velocity_range = 10.0;
    vec2 velocity = (unpack_uvec2_16(texture2D(texture_velocity, v_vScreencoord)) - FLOAT_16_OFFSET) * velocity_range;
    vec3 sample = texture2D(gm_BaseTexture, v_vTexcoord).xyw;
    velocity += (color.xy * sample.xy - FLOAT_16_OFFSET) * 8.0 * color.a * sample.z;
    
    gl_FragColor = pack_uvec2_16(clamp(velocity / velocity_range + FLOAT_16_OFFSET, 0.0, 1.0));
}
