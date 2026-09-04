varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_texel;
uniform vec3 u_shadowColor;
uniform vec3 u_rimColor;
uniform float u_rimStrength;
uniform float u_colorMix;
uniform float u_lightAmount;

void main()
{
    vec4 baseTex = texture2D(gm_BaseTexture, v_vTexcoord);
    float a = baseTex.a;

    if (a <= 0.0)
    {
        discard;
    }

    // Darkening is a straight brightness multiply on the sprite's OWN true
    // colours - never a flat colour wash. Even at u_lightAmount=0 (nowhere
    // near a window) a fraction of the real colour stays visible; it climbs
    // to full brightness right under a window. The pale rim colour is only
    // ever used for the thin edge outline below, never the body fill.
    vec3 trueColor = mix(u_shadowColor, baseTex.rgb, u_colorMix);
    float lightCurved = pow(clamp(u_lightAmount, 0.0, 1.0), 0.7);
    float minBrightness = 0.15;
    float brightness = mix(minBrightness, 1.0, lightCurved);
    vec3 lit = trueColor * brightness;

    // Edge detection from neighbouring alpha samples to fake a rim light -
    // always visible so the silhouette still reads even in full darkness.
    // Uses the minimum neighbour (not an average), so a single anti-aliased
    // edge pixel still gives a real, visible line instead of a diluted one.
    // A second, much weaker ring one texel further out gives a soft second
    // step of blending rather than one flat colour - a few in-between shades
    // along the line instead of a hard two-tone edge.
    float aUp1    = texture2D(gm_BaseTexture, v_vTexcoord + vec2(0.0, -u_texel.y)).a;
    float aDown1  = texture2D(gm_BaseTexture, v_vTexcoord + vec2(0.0,  u_texel.y)).a;
    float aLeft1  = texture2D(gm_BaseTexture, v_vTexcoord + vec2(-u_texel.x, 0.0)).a;
    float aRight1 = texture2D(gm_BaseTexture, v_vTexcoord + vec2( u_texel.x, 0.0)).a;
    float aUp2    = texture2D(gm_BaseTexture, v_vTexcoord + vec2(0.0, -u_texel.y * 2.0)).a;
    float aDown2  = texture2D(gm_BaseTexture, v_vTexcoord + vec2(0.0,  u_texel.y * 2.0)).a;
    float aLeft2  = texture2D(gm_BaseTexture, v_vTexcoord + vec2(-u_texel.x * 2.0, 0.0)).a;
    float aRight2 = texture2D(gm_BaseTexture, v_vTexcoord + vec2( u_texel.x * 2.0, 0.0)).a;

    float minA1 = min(min(aUp1, aDown1), min(aLeft1, aRight1));
    float minA2 = min(min(aUp2, aDown2), min(aLeft2, aRight2));

    float edge1 = clamp(1.0 - minA1, 0.0, 1.0);
    float edge2 = clamp(1.0 - minA2, 0.0, 1.0);

    float edge = clamp(edge1 + edge2 * 0.35, 0.0, 1.0);
    float rim = edge * u_rimStrength;

    vec3 finalColor = mix(lit, u_rimColor, rim);

    gl_FragColor = vec4(finalColor, a * v_vColour.a);
}
