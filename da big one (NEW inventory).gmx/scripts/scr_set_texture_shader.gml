///scr_set_texture_shader(sprite)

// https://forum.yoyogames.com/index.php?threads/using-a-texture-in-a-shader-cant-get-it-to-work.21858/

// set shader
shader_set(shdr_texture)

// set texture
var t_sampler = shader_get_sampler_index(shdr_texture, "overlayTexture");
var t_sprite = sprite_get_texture(argument0, 0);
texture_set_stage(t_sampler, t_sprite );

var _uvs_a = sprite_get_uvs(sprite_index, image_index);
var _uvs_b = sprite_get_uvs(argument0, 0);
shader_set_uniform_f(shader_get_uniform( shdr_texture, "u_vA" ), _uvs_a[0], _uvs_a[1], _uvs_a[2]-_uvs_a[0], _uvs_a[3]-_uvs_a[1]);
shader_set_uniform_f(shader_get_uniform( shdr_texture, "u_vB" ), _uvs_b[0], _uvs_b[1], _uvs_b[2]-_uvs_b[0], _uvs_b[3]-_uvs_b[1]);
