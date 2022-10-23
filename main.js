let seed = typeof tokenData !== 'undefined' ? typeof tokenData === 'string' ? tokenData : tokenData.hash : getSeed()
hash(seed)

let canvas, sh, time

function preload() {
    sh = loadShader('./shaders/vert.glsl', './shaders/frag.glsl')
}

function setup() {
    // disable scaling for retina screens 
    // which can create inconsistent scaling between displays
    pixelDensity(1)

    canvas = createCanvas(500, 500, WEBGL)
    noStroke()
}

function draw() {
    // sets the shader
    shader(sh)

    time = millis() / 1000

    // updates shader uniforms
    sh.setUniform('uResolution', [width, height])
    sh.setUniform('uTime', time)

    // creates a shape with the shader applied
    rect(0, 0, width, height)
}

function windowResized() {
    resizeCanvas(500, 500)

    sh.setUniform('uResolution', [width, height])
}