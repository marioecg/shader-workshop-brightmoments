precision mediump float;

varying vec2 vUv;

void main() {  
  vec2 uv = vUv;
  
  vec3 color = vec3(0.0); // Negro


  //////////////////////////////////////////
  // COLORES
  //////////////////////////////////////////

  // SINTESIS ADITIVA DE COLOR

  // Luz es utilizada para mostrar colores (rgb)

  // RGB EN PORCENTAJES

  // Valores de cada componente de color (rgb) son expresados en porcentajes (0% - 100%)
  // Cada porcentaje es dividido entre 100% para obtener 
  // un numero de punto flotante (Ejemplo: 100% / 100% = 1.0)

  vec3 c1 = vec3(0.0); // negro - rgb(0%, 0%, 0%)
  vec3 c2 = vec3(1.0); // blanco - rgb(100%, 100%, 100%)
  vec3 c3 = vec3(1.0, 0.0, 0.0); // rojo - rgb(100%, 0%, 0%)
  vec3 c4 = vec3(0.0, 1.0, 0.0); // verde - rgb(0%, 100%, 0%)
  vec3 c5 = vec3(0.0, 0.0, 1.0); // azul - rgb(0%, 0%, 100%)


  //////////////////////////////////////////
  // GEOMETRIAS BASICAS
  //////////////////////////////////////////

  // GEOMETRIAS BLANCAS EN FONDO NEGRO

  // CIRCULO
  // Mover geometria en el espacio - dentro de length (Ejemplo: vec2(uv.x + 0.5, uv.y - 0.3))
  float circ = length(uv);
  // Function de step(borde, x)
  // Si x < borde ? 0.0 es resultado (negro) : de lo contrario 1.0 (blanco) 
  circ = step(circ, 0.45);
  color += circ;

  // RECTANGULO O CUADRADO
  // Mover geometria en el espacio - dentro de abs (Ejemplo: uv.x + 0.2)
  // Expandir o reducir geometria rectangular - fuera de abs (Ejemplo: abs(uv.x) + 0.2)
  float rect = max(
      abs(uv.x),
      abs(uv.y)
  );
  rect = step(rect, 0.44);
  color += rect;

  // TRIANGULO
  // Mover geometria en el espacio - mover uv antes de definir geometria (Ejemplo: uv.x += 0.2)
  float tDiam = 0.5;
  float trian = max(
      abs(uv.x) + uv.y * tDiam,
      uv.y * -tDiam 
  );
  trian = step(trian, 0.225);
  color += trian;


  //////////////////////////////////////////
  // GRADIENTES
  //////////////////////////////////////////

  // LUMINOSIDAD

  // Entre mas luz refleja un color, mas luminoso (claro) se ve

  float gradRadial = length(uv);
  color += gradRadial;

  float gradLineal = uv.x;
  color += gradLineal;

  // SATURACION CONTINUA DE COLOR

  // Al combinar 2 colores saturados hay un punto medio en donde
  // la saturacion no favorece a ninguno de los 2 colores combinados

  // Function de mix(x, y, a)
  // x es el comienzo del rango
  // y es el final del rango
  // a es el valor de interpolacion
  vec3 gradMix = mix(c1, c2, uv.x);
  color += gradMix;

  // PINTAR GEOMETRIAS Y FONDO

  // Multiplicar un valor es como hacer un mask en PSD, AI en el area de luz (blanco)
  // Aplicamos el gradiente al area de luz (blanco)
  color *= gradMix;

  // Aplicamos el gradiente a ambas areas, de luz (blanco) y oscuridad (negro)
  // El area blanca tiene un gradiente mas tenue, que el area negra con un gradiente mas oscuro
  color += gradMix;

  // Aplicamos el gradiente al area de oscuridad (negro)
  color = mix(gradMix, color, color);

  // Aplicamos el gradiente al area de luz (blanco)
  color = mix(color, gradMix, color);


  //////////////////////////////////////////
  // PATRONES MATEMATICOS
  //////////////////////////////////////////

  // PATRONES NEGROS EN FONDO BLANCO

  // PATRON LINEAL CON LINEAS 
  float lFreq = 5.0; // 5.0
  float patronLineas = mod(uv.x * lFreq, 1.0);
  // float patronLineas = fract(uv.x * lFreq);
  patronLineas = step(0.5, patronLineas);
  color += patronLineas;

  // PATRON LINEAL CON RECTANGULO O CUADRADO 
  float freqR = 10.0;
  float patronRec = fract(
    max(
      abs(uv.x),
      abs(uv.y)
    )
    * freqR
  );
  patronRec = step(0.5, patronRec);
  color += patronRec;

  // PATRON DE RETICULA CON RECTANGULO O CUADRADO 
  float freqC = 5.0;
  float patronRetRec = max(
    abs(fract(uv.x * freqC)),
    abs(fract(uv.y * freqC))
  );
  patronRetRec = step(0.5, patronRetRec);
  color += patronRetRec;


  //////////////////////////////////////////
  // SALIDA DE COLOR
  //////////////////////////////////////////

  gl_FragColor = vec4(color, 1.0);
}