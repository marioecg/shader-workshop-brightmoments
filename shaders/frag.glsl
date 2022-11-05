// Define la precisión de bits de los números de punto flotante
precision mediump float; 

#define PI 3.1415926538

uniform float uTime;

varying vec2 vUv;

float map(float value, float min1, float max1, float min2, float max2) {
  return min2 + (value - min1) * (max2 - min2) / (max1 - min1);
}

float random(vec2 st) {
  return fract(sin(dot(st, vec2(12.9898, 78.233))) * 43758.5453);
}

vec2 rotate(vec2 pos, float a) {
	float s = sin(a);
	float c = cos(a);
	mat2 m = mat2(c, -s, s, c);
	return m * pos;
}

float rect(vec2 st, vec2 size){
	size = 0.25-size*0.25;
  vec2 uv = step(size,st*(1.0-st));
	return uv.x*uv.y;
}

void main() {    
  // Guardamos las variantes o uniformes en una variable para poder modificarlas después
  vec2 uv = vUv;
  float t = uTime;

  // RGB, el color será blanco porque todos los canales son igual a 1.0
  vec3 color = vec3(1.0, 1.0, 1.0); 
  // También existen otras formas de definir la variable vector
  // vec3 color = vec3(1.0);
  // o 
  // vec3 color;
  // color.r = 1.0;
  // color.g = 1.0;
  // color.b = 1.0;

  color = vec3(0.0);
  vec2 fuv = fract(vUv * 5.0);
  color.rg = fuv;

  // Cómo puedes obtener otro color, por ejemplo el rojo, magenta o amarillo? uv.x / uv.y
  // uv.x = uv.x;
  // uv.y = 1.0 - uv.y;
  // color.rgb = vec3(sin(vUv.x * 30.0));

  // Color final de salida RGBA
  gl_FragColor = vec4(color, 1.0); 
}