#ifdef GL_ES
precision mediump float;
#endif

//uniform vec3 vLighting;

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;
varying vec2 v_blurTexCoords[14];

uniform vec2 u_resolution;

void main() {
	gl_FragColor = texture2D(CC_Texture0, v_texCoord) * v_fragmentColor;
	float gray = (gl_FragColor.r + gl_FragColor.g + gl_FragColor.b) * (1.0 / 3.0);
	gl_FragColor = vec4(gray * 0.9, gray * 1.2, gray * 0.8, gl_FragColor.a * (gray + 0.1));
}