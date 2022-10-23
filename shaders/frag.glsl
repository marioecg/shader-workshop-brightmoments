#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 uResolution;
uniform float uTime;

varying vec2 vUv;

void main() {  
  vec2 uv = vUv;
  
  vec3 color = vec3(uv, 0.0);
  
  gl_FragColor = vec4(color, 1.0);
}