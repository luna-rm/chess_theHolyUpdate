room_s_w = 160*2.5
room_s_h = 256*2.5

view_visible[0] = true

view_wport[0] = room_s_w
view_hport[0] = room_s_h

window_set_size(view_wport[0], view_hport[0])
window_center()

//shader
horrifi_enable(true);

//aumentar com rituais
horrifi_bloom_set(false,26.56,0.30,0.72);
horrifi_chromaticab_set(false, 0);
horrifi_scanlines_set(true,0.05);
horrifi_vhs_set(false,0.10);
horrifi_vignette_set(false,1, 1);
horrifi_crt_set(false,2);
horrifi_noise_set(false,0);