// Define la precisión de bits de los números de punto flotante
precision mediump float; 

#define PI 3.1415926538

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

vec2 rotate(vec2 pos, float a) {
  float s = sin(a);
  float c = cos(a);
  mat2 m = mat2(c, -s, s, c);
  return m * pos;
}

void main() {    
  vec2 uv = vUv;
  float t = uTime;

  // Definimos los colores para el fondo y los cuadrados
  vec3 background = vec3(0.902,0.894,0.875) * 0.85;
  vec3 bigSquareColor = vec3(0.161,0.161,0.165);
  vec3 smallSquareColor = vec3(0.639,0.349,0.306);

  // Trasladamos un poco el sistema de coordenadas para el cuadrado grande
  vec2 uv1 = uv + vec2(0.15, -0.15);
  float bigSquare = rect(uv1, vec2(0.15));

  // Giramos el sistema alrededor del medio del canvas y despues lo trasladamos para crear el cuadro chico
  vec2 uv2 = uv;
  uv2 -= 0.5;
  uv2 = rotate(uv2, PI * 0.075);
  uv2 += 0.5;
  uv2 += vec2(-0.0, 0.25);
  float smallSquare = rect(uv2, vec2(0.05));

  // Combinamos los colores en base al area del cuadrado grande y chico
  vec3 color = background;
  color = mix(color, bigSquareColor, bigSquare);
  color = mix(color, smallSquareColor, smallSquare);

  // Damos un poco de textura al color
  float grain = random(vUv);
  color += grain * 0.1;

  // Color final de salida RGBA
  gl_FragColor = vec4(color, 1.0); 
}