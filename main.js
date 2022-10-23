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

// Save frame on CMD/CTRL + SHIF + S
window.addEventListener('keydown', (e) => {
    if ((window.navigator.platform.match("Mac") ? e.metaKey : e.ctrlKey) && e.keyCode == 83) {
        e.preventDefault()

        let date = new Date()
        let year = date.getFullYear()
        let month = date.getMonth() + 1
        let day = date.getUTCDate()
        let hour = date.getHours()
        let mins = date.getMinutes()
        let secs = date.getSeconds()
    
        let timestamp = `${year}-${month}-${day}-${hour}-${mins}-${secs}`        

        save(canvas, timestamp)
    }
}, false)

// Save video on CMD/CTRL + SHIF + S
window.addEventListener('keydown', (e) => {
    if ((window.navigator.platform.match("Mac") ? e.metaKey : e.ctrlKey) && e.keyCode == 86) {
        e.preventDefault()
    }
}, false)