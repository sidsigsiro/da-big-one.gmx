// Passthrough vertex shader.

struct VS_INPUT {
    float4 position: POSITION;
    float2 uv: TEXCOORD0;
};

struct VS_OUTPUT {
    float4 position: SV_POSITION;
    float2 uv: TEXCOORD0;
};

void main(in VS_INPUT IN, out VS_OUTPUT OUT) {
    OUT.position = mul(gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION], IN.position);
    OUT.uv = IN.uv;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~#define FLOAT_16_OFFSET (128.0 / 255.0)

struct PS_INPUT {
    float2 uv: TEXCOORD0;
};

struct PS_OUTPUT {
    float4 color_0: SV_TARGET0;
};

uniform sampler2D texture_pressure;

uniform float2 texel_size;

float2 unpack_uvec2_16(float4 data) {return float2(data.xy + (data.zw / 255.0));}
float4 pack_uvec2_16(float2 data) {return float4(floor(data * 255.0) / 255.0, frac(data * 255.0));}
float unpack_ufloat_16(float2 data) {return data.x + (data.y / 255.0);}

void main(in PS_INPUT IN, out PS_OUTPUT OUT) {
    float velocity_range = 10.0;
    float pressure_range = 10.0;
    
    float right = unpack_ufloat_16(tex2D(texture_pressure, IN.uv + float2(texel_size.x, 0.0)).xy) * pressure_range;
    float left = unpack_ufloat_16(tex2D(texture_pressure, IN.uv - float2(texel_size.x, 0.0)).xy) * pressure_range;
    float bottom = unpack_ufloat_16(tex2D(texture_pressure, IN.uv + float2(0.0, texel_size.y)).xy) * pressure_range;
    float top = unpack_ufloat_16(tex2D(texture_pressure, IN.uv - float2(0.0, texel_size.y)).xy) * pressure_range;
    
    float2 gradient = 0.5 * float2(right - left, bottom - top);
    
    float2 velocity = (unpack_uvec2_16(tex2D(gm_BaseTexture, IN.uv)) - FLOAT_16_OFFSET) * velocity_range;
    
    velocity -= gradient;
    
    OUT.color_0 = pack_uvec2_16(saturate(velocity / velocity_range + FLOAT_16_OFFSET));
}
