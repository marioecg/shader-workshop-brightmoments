// Define la precisión de bits de los números de punto flotante
precision mediump float; 

uniform float uTime;

varying vec2 vUv;

float random(vec2 st) {
  return fract(sin(dot(st, vec2(12.9898, 78.233))) * 43758.5453);
}

float rect(vec2 st, vec2 size) {
  size = 0.25 - size * 0.25;
  vec2 uv = step(size, st * (1.0 - st));
  return uv.x * uv.y;
}

void main() {    
  vec2 uv = vUv;
  float t = uTime;

  // Color del cuadrado y del fondo
  vec3 inner = vec3(0.937, 0.937, 0.937);
  vec3 outer = vec3(0.835, 0.839, 0.839);

  // Movemos un poco las coordenadas en Y para el cuadrado interior
  vec2 suv = uv + vec2(0.0, 0.05);
  vec2 size = vec2(0.45);
  float square = rect(suv, size);

  // Mezclamos los colores en base al area del cuadrado
  vec3 color = mix(outer, inner, square);

  // Dar un poco de textura al color
  float grain = random(vUv);
  color += grain * 0.1;  

  // Color final de salida RGBA
  gl_FragColor = vec4(color, 1.0); 
}