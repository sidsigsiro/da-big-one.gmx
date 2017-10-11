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
//######################_==_YOYO_SHADER_MARKER_==_######################@~#define colorize_color float4(0.5, 0.5, 0.5, 1.0)

struct PS_INPUT {
    float2 uv: TEXCOORD0;
    float4 color: COLOR0;
};

struct PS_OUTPUT {
    float4 color_0: SV_TARGET0;
};

void main(in PS_INPUT IN, out PS_OUTPUT OUT) {
    OUT.color_0 = IN.color * float4(colorize_color.rgb, colorize_color.a * tex2D(gm_BaseTexture, IN.uv).w);
}
