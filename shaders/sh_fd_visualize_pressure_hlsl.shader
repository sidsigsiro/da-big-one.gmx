// Passthrough vertex shader.

struct VS_INPUT {
    float4 position: POSITION;
    float2 uv: TEXCOORD0;
    float4 color: COLOR0;
};

struct VS_OUTPUT {
    float4 position: SV_POSITION;
    float2 uv: TEXCOORD0;
    float4 color: COLOR0;
};

void main(in VS_INPUT IN, out VS_OUTPUT OUT) {
    OUT.position = mul(gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION], IN.position);
    OUT.uv = IN.uv;
    OUT.color = IN.color;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~struct PS_INPUT {
    float2 uv: TEXCOORD0;
    float4 color: COLOR0;
};

struct PS_OUTPUT {
    float4 color_0: SV_TARGET0;
};

float unpack_ufloat_16(float2 data) {return data.x + (data.y / 255.0);}

void main(in PS_INPUT IN, out PS_OUTPUT OUT) {
    float pressure = unpack_ufloat_16(tex2D(gm_BaseTexture, IN.uv).xy);
    OUT.color_0 = IN.color * float4(pressure.xxx, 1.0);
}
