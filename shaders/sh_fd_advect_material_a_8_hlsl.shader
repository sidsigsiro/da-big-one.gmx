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
//######################_==_YOYO_SHADER_MARKER_==_######################@~#define USE_MACCORMACK_SCHEME true
#define FLOAT_16_OFFSET (128.0 / 255.0)

struct PS_INPUT {
    float2 uv: TEXCOORD0;
};

struct PS_OUTPUT {
    float4 color_0: SV_TARGET0;
};

uniform sampler2D texture_velocity;
uniform sampler2D texture_world;

uniform float2 texel_size;
uniform float2 precalculated; // x: time_step * texel_size.x, y: time_step * texel_size.y.
uniform float4 precalculated_1; // x: texel_size.x * 0.5, y: texel_size.y * 0.5, z: texel_size.x * -0.5, w: texel_size.y * -0.5.
uniform float3 precalculated_2; // x: dissipation_type, y: dissipation_value, z: maccormack_weight * 0.5.

float2 unpack_ufloat2_16(float4 data) {return float2(data.xy + (data.zw / 255.0));}

void main(in PS_INPUT IN, out PS_OUTPUT OUT) {
    float velocity_range = 10.0;
    if (tex2D(texture_world, IN.uv).w == 0.0) {
        float2 velocity = (unpack_ufloat2_16(tex2D(texture_velocity, IN.uv)) - FLOAT_16_OFFSET) * velocity_range;
        
        float2 from = IN.uv - precalculated.xy * velocity;
        float phi_hat_next = tex2D(gm_BaseTexture, from).w;
        float color;
        
        if (USE_MACCORMACK_SCHEME) {
            float2 phi_hat_next_velocity = (unpack_ufloat2_16(tex2D(texture_velocity, from)) - FLOAT_16_OFFSET) * velocity_range;
            
            float2 to = IN.uv + precalculated.xy * phi_hat_next_velocity;
            float phi_hat_now = tex2D(gm_BaseTexture, to).w;
            
            color = phi_hat_next + (tex2D(gm_BaseTexture, IN.uv).w - phi_hat_now) * precalculated_2.z;
            
            float2 coord = floor(from / texel_size + 0.5) * texel_size;
            float top_left = tex2D(gm_BaseTexture, coord + precalculated_1.zw).w;
            float bottom_right = tex2D(gm_BaseTexture, coord + precalculated_1.xy).w;
            float top_right = tex2D(gm_BaseTexture, coord + precalculated_1.xw).w;
            float bottom_left = tex2D(gm_BaseTexture, coord + precalculated_1.zy).w;
            color = clamp(color, min(min(min(top_left, top_right), bottom_left), bottom_right), max(max(max(top_left, top_right), bottom_left), bottom_right));
        } else {
            color = phi_hat_next;
        }
        
        if (precalculated_2.x < 0.5) color *= precalculated_2.y; else color -= precalculated_2.y;
        
        OUT.color_0 = float4(0.0, 0.0, 0.0, color);
    } else {
        OUT.color_0 = float4(0.0, 0.0, 0.0, 0.0);
    }
}
