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
//######################_==_YOYO_SHADER_MARKER_==_######################@~// 2D vector field visualization by Morgan McGuire, @morgan3d, http://casual-effects.com.

#define FLOAT_16_OFFSET (128.0 / 255.0)
#define PI 3.1415927
#define ARROW_TILE_SIZE 16.0
#define ARROW_HEAD_ANGLE (45.0 * PI / 180.0)
#define ARROW_HEAD_LENGTH (ARROW_TILE_SIZE / 4.0)
#define ARROW_SHAFT_THICKNESS 1.0

struct PS_INPUT {
    float2 uv: TEXCOORD0;
    float4 color: COLOR0;
};

struct PS_OUTPUT {
    float4 color_0: SV_TARGET0;
};

uniform float2 texel_size;

float2 unpack_ufloat2_16(float4 data) {return float2(data.xy + (data.zw / 255.0));}
float2 arrow_tile_center_coord(float2 pos) {return (floor(pos / ARROW_TILE_SIZE) + 0.5) * ARROW_TILE_SIZE;}
float2 field(float2 pos) {return (unpack_ufloat2_16(tex2D(gm_BaseTexture, pos * texel_size)) - FLOAT_16_OFFSET) * 2.0;}

float arrow(float2 p, float2 v) {
    p -= arrow_tile_center_coord(p);
    float mag_v = length(v), mag_p = length(p);

    if (mag_v > 0.0) {
        float2 dir_p = p / mag_p, dir_v = v / mag_v;
        mag_v = clamp(mag_v, 5.0, ARROW_TILE_SIZE / 2.0); // We can't draw arrows larger than the tile radius, so clamp magnitude. Enforce a minimum length to help see direction.
        v = dir_v * mag_v;
        
        // Signed distance from a line segment based on https://www.shadertoy.com/view/ls2GWG by Matthias Reitinger, @mreitinger.
        float dist =  max(
            ARROW_SHAFT_THICKNESS / 4.0 - max(abs(dot(p, float2(dir_v.y, -dir_v.x))), abs(dot(p, dir_v)) - mag_v + ARROW_HEAD_LENGTH / 2.0),
            min(0.0, dot(v - p, dir_v) - cos(ARROW_HEAD_ANGLE / 2.0) * length(v - p)) * 2.0 + min(0.0, dot(p, dir_v) + ARROW_HEAD_LENGTH - mag_v)
        );
            
        return clamp(1.0 + dist, 0.0, 1.0);
    } else {
        return max(0.0, 1.2 - mag_p);
    }
}

void main(in PS_INPUT IN, out PS_OUTPUT OUT) {
    OUT.color_0 = IN.color * lerp(
        float4(length(unpack_ufloat2_16(tex2D(gm_BaseTexture, IN.uv)) - FLOAT_16_OFFSET).xxx, 1.0),
        float4(0.0, 1.0, 1.0, 1.0),
        arrow(IN.uv / texel_size, field(arrow_tile_center_coord(IN.uv / texel_size)) * ARROW_TILE_SIZE * 0.4) * 0.3
    );
}
