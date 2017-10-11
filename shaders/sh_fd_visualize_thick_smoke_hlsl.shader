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
    float d_x = (tex2D(gm_BaseTexture, IN.uv + float2(texel_size.x, 0.0)).w + (tex2D(gm_BaseTexture, IN.uv + float2(texel_size.x, 0.0)).z / 255.0) -
            (tex2D(gm_BaseTexture, IN.uv - float2(texel_size.x, 0.0)).w + (tex2D(gm_BaseTexture, IN.uv - float2(texel_size.x, 0.0)).z / 255.0))) * 0.5;
    float d_y = (tex2D(gm_BaseTexture, IN.uv + float2(0.0, texel_size.y)).w + (tex2D(gm_BaseTexture, IN.uv + float2(0.0, texel_size.y)).z / 255.0) -
            (tex2D(gm_BaseTexture, IN.uv - float2(0.0, texel_size.y)).w + (tex2D(gm_BaseTexture, IN.uv - float2(0.0, texel_size.y)).z / 255.0))) * 0.5;
    
    float3 light_direction = normalize(float3(1.0, 1.0, -0.5));
    float steepness = 0.3;
    float3 normal = normalize(cross(normalize(float3(steepness, 0.0, d_x)), normalize(float3(0.0, steepness, d_y))));
    float lightness = clamp(pow(max(dot(normal, -light_direction), 0.0), 1.0), 0.0, 1.0);
    
    OUT.color_0 = IN.color * float4(lerp(float3(0.2, 0.16, 0.1), float3(0.9, 0.88, 0.8), lightness * 1.5), clamp((tex2D(gm_BaseTexture, IN.uv).w - 0.1) * 4.0 + 0.5, 0.0, 1.0));
}
