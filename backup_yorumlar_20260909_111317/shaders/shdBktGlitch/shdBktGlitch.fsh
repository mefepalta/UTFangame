





 



#define DELTA 0.00001
#define TAU 6.28318530718
#define NOISE_TEXTURE_SIZE 256.0
#define NOISE_TEXTURE_PIXEL_COUNT (NOISE_TEXTURE_SIZE * NOISE_TEXTURE_SIZE)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float intensity;
uniform float time;
uniform vec2  resolution;
uniform float rngSeed;
uniform vec3  randomValues;
uniform sampler2D noiseTexture;

uniform float lineSpeed;
uniform float lineDrift;
uniform float lineResolution;
uniform float lineVertShift;
uniform float lineShift;
uniform float jumbleness;
uniform float jumbleResolution;
uniform float jumbleShift;
uniform float jumbleSpeed;
uniform float dispersion;
uniform float channelShift;
uniform float noiseLevel;
uniform float shakiness;

vec4 extractRed(vec4 col){
    return vec4(col.r, 0., 0., col.a);
}

vec4 extractGreen(vec4 col){
    return vec4(0., col.g, 0., col.a);
}

vec4 extractBlue(vec4 col){
    return vec4(0., 0., col.b, col.a);
}

vec2 mirror(vec2 v) {
    return abs((fract((v * 0.5) + 0.5) * 2.0) - 1.0);
}

vec2 downsample(vec2 v, vec2 res) {
    return floor(v * res) / res;
}

vec4 whiteNoise(vec2 coord, vec2 texelOffset) {
	vec2 offset = downsample(vec2(rngSeed * NOISE_TEXTURE_SIZE, rngSeed) + texelOffset, vec2(NOISE_TEXTURE_SIZE));
    vec2 ratio = resolution / vec2(NOISE_TEXTURE_SIZE);
    return texture2D(noiseTexture, (coord * ratio) + offset);
}

vec4 random(float dataOffset) {
	vec2 halfTexelSize = vec2((0.5 / NOISE_TEXTURE_SIZE));
	float offset = rngSeed + dataOffset;
    return texture2D(noiseTexture, vec2(offset * NOISE_TEXTURE_SIZE, offset) + halfTexelSize);
}

vec2 jumble(vec2 coord){
	if ((jumbleShift * jumbleness * jumbleResolution) < DELTA) {
		return vec2(0.0);
	}
		
    vec2 gridCoords = (coord * jumbleResolution) / (NOISE_TEXTURE_SIZE * 0.0245);
	float jumbleTime = mod(floor(time * 0.02 * jumbleSpeed), NOISE_TEXTURE_PIXEL_COUNT);
	vec2 offset = random(jumbleTime / NOISE_TEXTURE_PIXEL_COUNT).ga * jumbleResolution;
    vec4 cellRandomValues = whiteNoise(gridCoords, vec2(jumbleResolution * -10.0) + offset);
    return (cellRandomValues.ra - 0.5) * jumbleShift * floor(min(0.99999, cellRandomValues.b) + jumbleness);
}

float lineOffset(vec2 coord) {
	if (lineShift < DELTA) {
		return 0.0;
	}
	
    vec2 waveHeights = vec2(50.0 * lineResolution, 25.0 * lineResolution);
    vec4 lineRandom = whiteNoise(downsample(v_vTexcoord.yy, waveHeights), vec2(0.0));
    float driftTime = v_vTexcoord.y * resolution.y * 2.778;
    
    vec4 waveTimes = (vec4(downsample(lineRandom.ra * TAU, waveHeights) * 80.0, driftTime + 2.0, (driftTime * 0.1) + 1.0) + (time * lineSpeed)) + (lineVertShift * TAU);
    vec4 waveLineOffsets = vec4(sin(waveTimes.x), cos(waveTimes.y), sin(waveTimes.z), cos(waveTimes.w));
    waveLineOffsets.xy *= ((whiteNoise(waveTimes.xy, vec2(0.0)).gb - 0.5) * shakiness) + 1.0;
    waveLineOffsets.zw *= lineDrift;
    return dot(waveLineOffsets, vec4(1.0));
}

void main()
{
    vec4 randomHiFreq = whiteNoise(v_vTexcoord, randomValues.xy);
    
    vec2 offsetCoords = v_vTexcoord;
    offsetCoords.x += ((((2.0 * randomValues.z) - 1.0) * shakiness * lineSpeed) + lineOffset(offsetCoords)) * lineShift * intensity;
    
    offsetCoords += jumble(offsetCoords) * intensity * intensity * 0.25;
        
    vec2 shiftFactors = (channelShift + (randomHiFreq.rg * dispersion)) * intensity;
    vec4 outColour;
	
    if (((channelShift + dispersion) * intensity) < DELTA) {
		outColour = texture2D(gm_BaseTexture, mirror(offsetCoords));
	} else {
		outColour = extractRed(texture2D(gm_BaseTexture, mirror(offsetCoords + vec2(shiftFactors.r, 0.0)))) + extractBlue(texture2D(gm_BaseTexture, mirror(offsetCoords + vec2(-shiftFactors.g, 0.0)))) + extractGreen(texture2D(gm_BaseTexture, mirror(offsetCoords)));
	}
	
    outColour.rgb *= (vec3(.55, .5, .4) * randomHiFreq.gab * intensity * noiseLevel) + 1.0;
        
    gl_FragColor = v_vColour * outColour;
}