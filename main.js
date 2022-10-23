let canvas, shd, time
let W = 500
let H = 500

function preload() {
    shd = loadShader('./shaders/vert.glsl', './shaders/frag.glsl')
}

function setup() {
    // disable scaling for retina screens 
    // which can create inconsistent scaling between displays
    pixelDensity(1)

    canvas = createCanvas(W, H, WEBGL)
    noStroke()
}

function draw() {
    // sets the shader
    shader(shd)

    time = millis() / 1000

    // updates shader uniforms
    shd.setUniform('uResolution', [W, H])
    shd.setUniform('uTime', time)

    // creates a shape with the shader applied
    rect(0, 0, W, H)
}

function windowResized() {
    resizeCanvas(W, H)

    shd.setUniform('uResolution', [W, H])
}