// Define la precisión de bits de los números de punto flotante
precision mediump float; 

uniform float uTime;

varying vec2 vUv;

float map(float value, float min1, float max1, float min2, float max2) {
  return min2 + (value - min1) * (max2 - min2) / (max1 - min1);
}

void main() {    
  vec2 uv = vUv;
  float t = uTime;

  // Gradiente vertical
  vec3 bottom = vec3(0.922, 0.369, 0.29);
  vec3 top = vec3(0.251, 0.22, 0.369);
  vec3 color = mix(bottom, top, smoothstep(0.0, 1.0, vUv.y));

  // Circulo pulsando
  vec2 cuv = vUv - vec2(0.5, 0.0);
  float circle = length(cuv);
  float sizePulse = map(cos(t * 0.5), -1.0, 1.0, 0.3, 0.6);
  circle = smoothstep(sizePulse, 0.0, circle);
  color += circle;  

  // Color final de salida RGBA
  gl_FragColor = vec4(color, 1.0); 
}