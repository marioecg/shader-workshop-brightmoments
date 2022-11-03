// Define la precisión de bits de los números de punto flotante
precision mediump float;

// Coordenadas
attribute vec2 aTexCoord;
// Vértices de los triángulos que forman el cuadrado (o "quad")
attribute vec3 aPosition;

varying vec2 vUv;

void main() {
  // Pasa las coordinadas al fragment shader en una variable vec2
  vUv = aTexCoord;

  vec4 pos = vec4(aPosition, 1.0);
  pos.xy = pos.xy * 2.0 - 1.0;

  gl_Position = pos;
}