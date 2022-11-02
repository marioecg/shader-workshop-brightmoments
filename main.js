let canvas, shd, time
let W = 500
let H = 500

function preload() {
    // Carga los archivos del shader
    shd = loadShader('./shaders/vert.glsl', './shaders/frag.glsl')
}

function setup() {
    // Evita que la densidad escale en pantallas tipo retina
    // que puede crear un escalado inconsistente entre monitores
    pixelDensity(1)

    canvas = createCanvas(W, H, WEBGL)
    noStroke()
}

function draw() {
    // Asigna el shader
    shader(shd)

    time = millis() / 1000

    // Actualiza las uniformes
    shd.setUniform('uTime', time)
    shd.setUniform('uResolution', [W, H])

    // Crea una figura que usa el shader
    rect(0, 0, W, H)
}

function windowResized() {
    resizeCanvas(W, H)

    // Actualiza las uniformes
    shd.setUniform('uResolution', [W, H])
}