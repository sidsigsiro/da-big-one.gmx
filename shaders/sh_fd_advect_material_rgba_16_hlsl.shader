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
#define COLOR_OUTSIDE float4(0.714, 0.714, 0.714, 0.0)

struct PS_INPUT {
    float2 uv: TEXCOORD0;
};

struct PS_OUTPUT {
    float4 color_0: SV_TARGET0;
    float4 color_1: SV_TARGET1;
};

uniform sampler2D texture_material_1;
uniform sampler2D texture_velocity;
uniform sampler2D texture_world;

uniform float dissipation_type;
uniform float dissipation_value;
uniform float maccormack_weight_half;
uniform float2 texel_size;
uniform float2 precalculated; // x: time_step * texel_size.x, y: time_step * texel_size.y.
uniform float4 precalculated_1; // x: texel_size.x * 0.5, y: texel_size.y * 0.5, z: texel_size.x * -0.5, w: texel_size.y * -0.5.

float2 unpack_uvec2_16(float4 data) {return float2(data.xy + (data.zw / 255.0));}

void main(in PS_INPUT IN, out PS_OUTPUT OUT) {
    float velocity_range = 10.0;
    if (tex2D(texture_world, IN.uv).w == 0.0) {
        float2 velocity = (unpack_uvec2_16(tex2D(texture_velocity, IN.uv)) - FLOAT_16_OFFSET) * velocity_range;
        
        float2 from = IN.uv - precalculated.xy * velocity;
        float4 phi_hat_next = tex2D(gm_BaseTexture, from) + (tex2D(texture_material_1, from) / 255.0);
        float4 color;
        
        if (USE_MACCORMACK_SCHEME) {
            float2 phi_hat_next_velocity = (unpack_uvec2_16(tex2D(texture_velocity, from)) - FLOAT_16_OFFSET) * velocity_range;
            
            float2 to = IN.uv + precalculated.xy * phi_hat_next_velocity;
            float4 phi_hat_now = tex2D(gm_BaseTexture, to) + (tex2D(texture_material_1, to) / 255.0);
            
            color = phi_hat_next + ((tex2D(gm_BaseTexture, IN.uv) + (tex2D(texture_material_1, IN.uv) / 255.0)) - phi_hat_now) * maccormack_weight_half;
            
            float2 coord = round(from / texel_size) * texel_size;
            float4 top_left = tex2D(gm_BaseTexture, coord + precalculated_1.zw) + (tex2D(texture_material_1, coord + precalculated_1.zw) / 255.0);
            float4 bottom_right = tex2D(gm_BaseTexture, coord + precalculated_1.xy) + (tex2D(texture_material_1, coord + precalculated_1.xy) / 255.0);
            float4 top_right = tex2D(gm_BaseTexture, coord + precalculated_1.xw) + (tex2D(texture_material_1, coord + precalculated_1.xw) / 255.0);
            float4 bottom_left = tex2D(gm_BaseTexture, coord + precalculated_1.zy) + (tex2D(texture_material_1, coord + precalculated_1.zy) / 255.0);
            color = clamp(color, min(min(min(top_left, top_right), bottom_left), bottom_right), max(max(max(top_left, top_right), bottom_left), bottom_right));
        } else {
            color = phi_hat_next;
        }
        
        if (dissipation_type < 0.5) color *= dissipation_value; else color -= dissipation_value;
        
        OUT.color_0 = floor(color * 255.0) / 255.0;
        OUT.color_1 = frac(color * 255.0);
    } else {
        OUT.color_0 = COLOR_OUTSIDE;
        OUT.color_1 = float4(0.0, 0.0, 0.0, 0.0);
    }
}
