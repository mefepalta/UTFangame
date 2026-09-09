varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 u_color;
uniform float u_topWidthFrac;
uniform float u_bottomWidthFrac;
uniform float u_softness;
uniform float u_intensity;

void main()
{
    float y = v_vTexcoord.y; // 0 = top (at the window), 1 = bottom (floor)
    float halfWidth = mix(u_topWidthFrac, u_bottomWidthFrac, y);
    float distFromCenter = abs(v_vTexcoord.x - 0.5);

    float edge = 1.0 - smoothstep(max(halfWidth - u_softness, 0.0), halfWidth, distFromCenter);
    float vFade = pow(clamp(1.0 - y, 0.0, 1.0), 1.6);

    float alpha = edge * vFade * u_intensity;

    gl_FragColor = vec4(u_color, alpha * v_vColour.a);
}
