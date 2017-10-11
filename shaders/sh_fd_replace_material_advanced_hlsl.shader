struct VS_INPUT {
    float4 position: POSITION;
    float2 uv_base_texture: TEXCOORD0;
    float4 color: COLOR;
};

struct VS_OUTPUT {
    float4 position: SV_POSITION;
    float2 uv_base_texture: TEXCOORD0;
    float4 color: COLOR;
    float2 uv_screen: TEXCOORD1;
};

uniform float2 addend;

void main(in VS_INPUT IN, out VS_OUTPUT OUT) {
    OUT.position = mul(gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION], IN.position);
    OUT.uv_base_texture = IN.uv_base_texture;
    OUT.uv_screen = OUT.position.xy * float2(0.5, -0.5) + addend;
    OUT.color = IN.color;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~struct PS_INPUT {
    float2 uv_base_texture: TEXCOORD0;
    float4 color: COLOR;
    float2 uv_screen: TEXCOORD1;
};

struct PS_OUTPUT {
    float4 color_0: SV_TARGET0;
};

uniform sampler2D texture_material_0;

void main(in PS_INPUT IN, out PS_OUTPUT OUT) {
    float4 destination = tex2D(texture_material_0, IN.uv_screen);
    float4 source = IN.color * tex2D(gm_BaseTexture, IN.uv_base_texture);
    OUT.color_0 = source * float4(source.aaa, 1.0) + destination * (1.0 - source.aaaa);
}
