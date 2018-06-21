let greenPin = 0
let bluePin = 0
let redPin = 0
let blue = 0
let green = 0
let red = 0
input.onButtonPressed(Button.B, () => {
    basic.showString("PRESS A TO LOG IN!")
})
input.onButtonPressed(Button.A, () => {
    while (true) {
        basic.showString("cheapjack")
        red = 255
        green = 0
        blue = 0
        redPin = pins.map(
        red,
        0,
        255,
        0,
        1023
        )
        pins.analogWritePin(AnalogPin.P0, redPin)
        for (let i = 0; i < 256; i++) {
            blue += 1
            bluePin = pins.map(blue,0,255,0,1023)
            pins.analogWritePin(AnalogPin.P1, bluePin)
            red += -1
            redPin = pins.map(red,0,255,0,1023)
            pins.analogWritePin(AnalogPin.P0, redPin)
            basic.pause(10)
        }
        for (let i = 0; i < 256; i++) {
            blue += -1
            bluePin = pins.map(blue,0,255,0,1023)
            pins.analogWritePin(AnalogPin.P1, bluePin)
            green += 1
            greenPin = pins.map(green,0,255,0,1023)
            pins.analogWritePin(AnalogPin.P2, greenPin)
            basic.pause(10)
        }
        for (let i = 0; i < 256; i++) {
            green += -1
            greenPin = pins.map(red,0,255,0,1023)
            pins.analogWritePin(AnalogPin.P2, greenPin)
            red += 1
            redPin = pins.map(red,0,255,0,1023)
            pins.analogWritePin(AnalogPin.P0, redPin)
            basic.pause(10)
        }
    }
})
basic.showString("PRESS A TO LOG IN!")
