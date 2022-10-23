let getSeed = () => {
    let x = '0123456789abcdef', hash = '0x'
    for (let i = 64; i > 0; --i) {
        hash += x[Math.floor(Math.random() * x.length)]
    }
    return hash
}

let _random, S, s, t

let hash = (hash = 'tx piter') => {
    _random = S = s = t = null
    S = Uint32Array.from([0, 1, s = t = 2, 3].map(i => parseInt(hash.substr(i * 8 + 2, 8), 16)))
    _random = _ => (t = S[3], S[3] = S[2], S[2] = S[1], S[1] = s = S[0], t ^= t << 11, S[0] ^= (t ^ t >>> 8) ^ (s >>> 19), S[0] / 2 ** 32)
}

let R = (min, max) => {
    if (min === undefined) {
        min = 0
        max = 1
    } else {
        max = max || 0
    }

    return min + _random() * (max - min)
}