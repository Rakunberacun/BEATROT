shader_type canvas_item;

uniform float SPEED = 0.1; // Kecepatan animasi
uniform float SCALE = 0.1; // Faktor pengali tambahan untuk memperlambat animasi
uniform float START_TIME = 0.0; // Waktu mulai animasi (akan di-reset dari GDScript)

void fragment() {
    // Skala waktu untuk mengontrol kecepatan
    float adjusted_time = (TIME - START_TIME) * SPEED * SCALE;

    // Geser UV hanya pada sumbu X berdasarkan waktu
    vec2 shifted_uv = UV + vec2(adjusted_time, 0.0);

    // Ambil warna dari tekstur berdasarkan UV baru
    COLOR = texture(TEXTURE, shifted_uv);
}
