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
//######################_==_YOYO_SHADER_MARKER_==_######################@~#define FLOAT_16_OFFSET (128.0 / 255.0)

struct PS_INPUT {
    float2 uv_base_texture: TEXCOORD0;
    float4 color: COLOR;
    float2 uv_screen: TEXCOORD1;
};

struct PS_OUTPUT {
    float4 color_0: SV_TARGET0;
};

uniform sampler2D texture_velocity;

float2 unpack_velocity(float4 data) {return float2(data.xy + (data.zw / 255.0));}
float4 pack_velocity(float2 data) {return float4(floor(data * 255.0) / 255.0, frac(data * 255.0));}

void main(in PS_INPUT IN, out PS_OUTPUT OUT) {
    float velocity_range = 10.0;
    float2 velocity = (unpack_velocity(tex2D(texture_velocity, IN.uv_screen)) - FLOAT_16_OFFSET) * velocity_range;
    float3 sample = tex2D(gm_BaseTexture, IN.uv_base_texture).xyw;
    velocity += (IN.color.xy * sample.xy - FLOAT_16_OFFSET) * 8.0 * IN.color.a * sample.z;
    
    OUT.color_0 = pack_velocity(saturate(velocity / velocity_range + FLOAT_16_OFFSET));
}
