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

uniform float initial_value_pressure;
uniform float2 texel_size;

float2 unpack_ufloat2_16(float4 data) {return float2(data.xy + (data.zw / 255.0));}
float2 pack_ufloat_16(float data) {return float2(floor(data * 255.0) / 255.0, frac(data * 255.0));}

void main(in PS_INPUT IN, out PS_OUTPUT OUT) {
    float2 right = unpack_ufloat2_16(tex2D(gm_BaseTexture, IN.uv + float2(texel_size.x, 0.0))) - FLOAT_16_OFFSET;
    float2 left = unpack_ufloat2_16(tex2D(gm_BaseTexture, IN.uv - float2(texel_size.x, 0.0))) - FLOAT_16_OFFSET;
    float2 bottom = unpack_ufloat2_16(tex2D(gm_BaseTexture, IN.uv + float2(0.0, texel_size.y))) - FLOAT_16_OFFSET;
    float2 top = unpack_ufloat2_16(tex2D(gm_BaseTexture, IN.uv - float2(0.0, texel_size.y))) - FLOAT_16_OFFSET;
    
    OUT.color_0 = float4(initial_value_pressure, 0.0, pack_ufloat_16(clamp((0.5 * ((right.x - left.x) + (bottom.y - top.y))) + FLOAT_16_OFFSET, 0.0, 1.0)));
}
