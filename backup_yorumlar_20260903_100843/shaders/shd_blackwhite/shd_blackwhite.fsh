//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 tex = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 pix = tex;
	pix.r = (tex.r+tex.g+tex.b)/3.;
	pix.g = (tex.r+tex.g+tex.b)/3.;
	pix.b =  (tex.r+tex.g+tex.b)/3.;
	gl_FragColor = pix;
}
