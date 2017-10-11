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
//######################_==_YOYO_SHADER_MARKER_==_######################@~#define USE_ACCELERATION_FIELD false
#define USE_MACCORMACK_SCHEME true
#define FLOAT_16_OFFSET (128.0 / 255.0)
#define FLOAT_8_OFFSET (128.0 / 255.0)

struct PS_INPUT {
    float2 uv: TEXCOORD0;
};

struct PS_OUTPUT {
    float4 color_0: SV_TARGET0;
};

uniform sampler2D texture_world;
uniform sampler2D texture_material;

uniform float4 precalculated; // x: time_step * texel_size.x, y: time_step * texel_size.y, z: texel_size.x, w: texel_size.y.
uniform float3 precalculated_1; // x: velocity_dissipation_type, y: velocity_dissipation_value, z: velocity_maccormack_weight * 0.5.
uniform float4 acceleration;

float2 unpack_uvec2_16(float4 data) {return float2(data.xy + (data.zw / 255.0));}
float4 pack_uvec2_16(float2 data) {return float4(floor(data * 255.0) / 255.0, frac(data * 255.0));}

void main(in PS_INPUT IN, out PS_OUTPUT OUT) {
    float velocity_range = 10.0;

    float2 velocity = (unpack_uvec2_16(tex2D(gm_BaseTexture, IN.uv)) - FLOAT_16_OFFSET) * velocity_range;

    float2 from = IN.uv - precalculated.xy * velocity;
    float2 phi_hat_next = (unpack_uvec2_16(tex2D(gm_BaseTexture, from)) - FLOAT_16_OFFSET) * velocity_range;
    
    if (USE_MACCORMACK_SCHEME) {
        float2 phi_hat_now = (unpack_uvec2_16(tex2D(gm_BaseTexture, IN.uv + precalculated.xy * phi_hat_next)) - FLOAT_16_OFFSET) * velocity_range;
        velocity = phi_hat_next + (velocity - phi_hat_now) * precalculated_1.z;
        
        float2 coord = round(from / precalculated.zw) * precalculated.zw;
        float2 top_left = (unpack_uvec2_16(tex2D(gm_BaseTexture, coord + float2(-precalculated.z, -precalculated.w) * 0.5)) - FLOAT_16_OFFSET) * velocity_range;
        float2 bottom_right = (unpack_uvec2_16(tex2D(gm_BaseTexture, coord + float2(precalculated.z, precalculated.w) * 0.5)) - FLOAT_16_OFFSET) * velocity_range;
        float2 top_right = (unpack_uvec2_16(tex2D(gm_BaseTexture, coord + float2(precalculated.z, -precalculated.w) * 0.5)) - FLOAT_16_OFFSET) * velocity_range;
        float2 bottom_left = (unpack_uvec2_16(tex2D(gm_BaseTexture, coord + float2(-precalculated.z, precalculated.w) * 0.5)) - FLOAT_16_OFFSET) * velocity_range;
        velocity = clamp(velocity, min(min(min(top_left, top_right), bottom_left), bottom_right), max(max(max(top_left, top_right), bottom_left), bottom_right));
    } else {
        velocity = phi_hat_next;
    }
    
    if (precalculated_1.x < 0.5) velocity *= precalculated_1.y;
    else {
        if (velocity.x > 0.0) velocity.x = max(0.0, velocity.x - precalculated_1.y); else velocity.x = min(0.0, velocity.x + precalculated_1.y);
        if (velocity.y > 0.0) velocity.y = max(0.0, velocity.y - precalculated_1.y); else velocity.y = min(0.0, velocity.y + precalculated_1.y);
    }
    
    float3 world = tex2D(texture_world, IN.uv).xyw;
    
    float amount = tex2D(texture_material, IN.uv).w;
    velocity += acceleration.xy * (acceleration.z * amount * amount + acceleration.w * amount) + (world.xy - FLOAT_8_OFFSET) * float(USE_ACCELERATION_FIELD);
    
    if (world.z != 0.0) velocity = float2(0.0, 0.0);
    
    OUT.color_0 = pack_uvec2_16(clamp(velocity / velocity_range + FLOAT_16_OFFSET, 0.0, 1.0));
}
