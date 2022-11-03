// Define la precisión de bits de los números de punto flotante
precision mediump float; 

varying vec2 vUv;

void main() {    
  // RGB, el color será blanco porque todos los canales son igual a 1.0
  vec3 color = vec3(1.0, 1.0, 1.0); 

  // 1) Cómo puedes obtener otro color, por ejemplo el rojo, magenta o amarillo?

  // 2) Usa las coordenadas provenientes del vertex para mostrar un gradiente de colores,
  //    color = vec3(vUv, 0.0);

  // Colo final de salida RGBA
  gl_FragColor = vec4(color, 1.0); 
}