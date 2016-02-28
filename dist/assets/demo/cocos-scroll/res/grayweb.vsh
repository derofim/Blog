#ifdef GL_ES
precision mediump float;
#endif

attribute vec4 a_position;
attribute vec2 a_texCoord;
attribute vec4 a_color;

#ifdef GL_ES
varying mediump vec2 v_texCoord;
varying mediump vec4 v_fragmentColor;
#else
varying vec2 v_texCoord;
varying vec4 v_fragmentColor;
#endif

varying vec2 v_blurTexCoords[14];

//uniform float u_rate;

void main()
{
	float u_rate = 1.8;
	gl_Position = (CC_PMatrix * CC_MVMatrix) * a_position; // on web
	// gl_Position = CC_PMatrix * a_position; // on native and mobile

	v_fragmentColor = a_color;
    v_texCoord = a_texCoord;
	v_blurTexCoords[ 0] = v_texCoord + vec2(-0.028 * u_rate, 0.0);
    v_blurTexCoords[ 1] = v_texCoord + vec2(-0.024 * u_rate, 0.0);
    v_blurTexCoords[ 2] = v_texCoord + vec2(-0.020 * u_rate, 0.0);
    v_blurTexCoords[ 3] = v_texCoord + vec2(-0.016 * u_rate, 0.0);
    v_blurTexCoords[ 4] = v_texCoord + vec2(-0.012 * u_rate, 0.0);
    v_blurTexCoords[ 5] = v_texCoord + vec2(-0.008 * u_rate, 0.0);
    v_blurTexCoords[ 6] = v_texCoord + vec2(-0.004 * u_rate, 0.0);
    v_blurTexCoords[ 7] = v_texCoord + vec2( 0.004 * u_rate, 0.0);
    v_blurTexCoords[ 8] = v_texCoord + vec2( 0.008 * u_rate, 0.0);
    v_blurTexCoords[ 9] = v_texCoord + vec2( 0.012 * u_rate, 0.0);
    v_blurTexCoords[10] = v_texCoord + vec2( 0.016 * u_rate, 0.0);
    v_blurTexCoords[11] = v_texCoord + vec2( 0.020 * u_rate, 0.0);
    v_blurTexCoords[12] = v_texCoord + vec2( 0.024 * u_rate, 0.0);
    v_blurTexCoords[13] = v_texCoord + vec2( 0.028 * u_rate, 0.0);
}