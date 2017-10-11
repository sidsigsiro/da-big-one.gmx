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
//######################_==_YOYO_SHADER_MARKER_==_######################@~#define PIXELATION_SIZE 1.6

struct PS_INPUT {
    float2 uv: TEXCOORD0;
    float4 color: COLOR0;
};

struct PS_OUTPUT {
    float4 color_0: SV_TARGET0;
};

uniform float2 texel_size;

void main(in PS_INPUT IN, out PS_OUTPUT OUT) {
    float reaction_coordinate = tex2D(gm_BaseTexture, floor(IN.uv / (texel_size * PIXELATION_SIZE)) * (texel_size * PIXELATION_SIZE)).w;

    OUT.color_0.rgb = float3(1.0, 0.2, 0.0);
    if (reaction_coordinate > 0.37) OUT.color_0.rgb = float3(1.0, 0.8, 0.0);
    if (reaction_coordinate > 0.65) OUT.color_0.rgb = float3(1.0, 1.0, 1.0);
    OUT.color_0.a = float(reaction_coordinate > 0.1);
    
    OUT.color_0 *= IN.color;
}
