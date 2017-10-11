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

uniform float2 texel_size;
uniform float2 precalculated; //x: 1.0 - relaxation_parameter, y: 0.25 * relaxation_parameter.

float unpack_ufloat_16(float2 data) {return data.x + (data.y / 255.0);}
float2 pack_ufloat_16(float data) {return float2(floor(data * 255.0) / 255.0, frac(data * 255.0));}

void main(in PS_INPUT IN, out PS_OUTPUT OUT) {
    float velocity_range = 10.0;
    float pressure_range = 10.0;

    OUT.color_0 = tex2D(gm_BaseTexture, IN.uv);
    float pressure = unpack_ufloat_16(OUT.color_0.xy) * pressure_range;
    float right = unpack_ufloat_16(tex2D(gm_BaseTexture, IN.uv + float2(texel_size.x, 0.0)).xy) * pressure_range;
    float left = unpack_ufloat_16(tex2D(gm_BaseTexture, IN.uv - float2(texel_size.x, 0.0)).xy) * pressure_range;
    float bottom = unpack_ufloat_16(tex2D(gm_BaseTexture, IN.uv + float2(0.0, texel_size.y)).xy) * pressure_range;
    float top = unpack_ufloat_16(tex2D(gm_BaseTexture, IN.uv - float2(0.0, texel_size.y)).xy) * pressure_range;
    
    float divergence = (unpack_ufloat_16(OUT.color_0.zw) - FLOAT_16_OFFSET) * velocity_range;
    
    pressure = precalculated.x * pressure + (left + right + top + bottom - divergence) * precalculated.y;
    
    OUT.color_0.xy = pack_ufloat_16(pressure / pressure_range);
}
