varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float time;

const float speed = 0.01;
const float Yfrequency = 95.0 * 10.0;
const float Ysize = 0.0002;
const float screenHeight = 480.0;
const float edgeHeight = 240.0;

void main() {
    float edgeEffect = 0.0;

    if (v_vTexcoord.y * screenHeight <= edgeHeight || v_vTexcoord.y * screenHeight >= (screenHeight - edgeHeight)) {
        edgeEffect = sin(time * speed + v_vTexcoord.x * Yfrequency) * Ysize; // Используем координату x для изменения во времени
    }

    vec4 distort = v_vColour * texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + edgeEffect));

    gl_FragColor = distort;
}