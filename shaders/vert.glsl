precision mediump float;

attribute vec2 aTexCoord;
attribute vec3 aPosition;

varying vec2 vUv;

void main() {
  vUv = aTexCoord;

  vec4 pos = vec4(aPosition, 1.0);
  pos.xy = pos.xy * 2.0 - 1.0;

  gl_Position = pos;
}