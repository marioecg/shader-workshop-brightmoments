// Define la precisión de bits de los números de punto flotante
precision mediump float; 

#define PI 3.1415926538

uniform float uTime;

varying vec2 vUv;

void main() {    
  vec2 uv = vUv;
  float t = uTime;

  // Creamos unas curvas con las coordenadas horizontales y verticales
  float innerWave = cos(vUv.x * 3.0 - t) * sin(vUv.y * 5.0 - t);
  // Usamos la misma ola dentro de otra ola para crear disparidad en el movimiento
  float wave = sin(vUv.y * 140.0 + innerWave * 8.0) * 0.5 + 0.5;
  // Suavizamos las curvas
  wave = smoothstep(0.5, 0.6, wave);

  vec3 color = vec3(0.0); 
  color += wave;  

  // Color final de salida RGBA
  gl_FragColor = vec4(color, 1.0); 
}