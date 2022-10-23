#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 uResolution;
uniform float uTime;

varying vec2 vUv;

void main() {  
  vec2 uv = vUv;
  vec2 st = (gl_FragCoord.xy - 0.5 * uResolution) / uResolution.y;

  vec3 color = vec3(uv,step(vUv.x, cos(uTime) * 0.5 + 0.5));
  
  gl_FragColor = vec4(color, 1.0);
}