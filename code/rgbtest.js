// Microbit code  for ThoughtsOnTheDesktop desk in-use notifier
/*  Show instructions to 'log in' to a desk by pressing button A
	Cycle RGB colour gradients displaying the desk users name
    Reset with button B
	To use open https://makecode.microbit.org/# in a browser select 
    `{ } JavaScript` over `Blocks` in top middle of browser screen
    and paste this in. Switch to `Blocks` if you prefer
    Plugin your microbit
    Download the `.hex` file and move to your microbit 
*/
// Initialise variables
let greenPin = 0
let bluePin = 0
let redPin = 0
let blue = 0
let green = 0
let red = 0
// Revert to basic instructions
input.onButtonPressed(Button.B, () => {
    basic.showString("PRESS A TO LOG IN!")
})
// PRESS BUTTON A to indicate user is at the desk
input.onButtonPressed(Button.A, () => {
    // Change this to the user & message you want
    basic.showString("Ross")
    // initial values
    red = 255
    green = 0
    blue = 0
    // map analogue pin values to RGB 25gcolours
    redPin = pins.map(
        red,
        0,
        255,
        0,
        1023
    )
    pins.analogWritePin(AnalogPin.P0, redPin)
    // Loop to increase the value of the blue LED
    for (let i = 0; i < 256; i++) {
        blue += 1
        bluePin = pins.map(
            blue,
            0,
            255,
            0,
            1023
        )
        // decrease the value of the red LED
        pins.analogWritePin(AnalogPin.P1, bluePin)
        red += -1
        redPin = pins.map(
            red,
            0,
            255,
            0,
            1023
        )
        pins.analogWritePin(AnalogPin.P0, redPin)
        basic.showString("Ross")
        // wait a bit
        basic.pause(10)
    }
    // reverse the cycle
    for (let i = 0; i < 256; i++) {
        blue += -1
        bluePin = pins.map(
            blue,
            0,
            255,
            0,
            1023
        )
        pins.analogWritePin(AnalogPin.P1, bluePin)
        green += 1
        greenPin = pins.map(
            green,
            0,
            255,
            0,
            1023
        )
        pins.analogWritePin(AnalogPin.P2, greenPin)
        basic.pause(10)
    }
    for (let i = 0; i < 256; i++) {
        green += -1
        greenPin = pins.map(
            red,
            0,
            255,
            0,
            1023
        )
        pins.analogWritePin(AnalogPin.P2, greenPin)
        red += 1
        redPin = pins.map(
            red,
            0,
            255,
            0,
            1023
        )
        pins.analogWritePin(AnalogPin.P0, redPin)
        basic.pause(10)
    }
})
// Instruction loop on Start
basic.showString("PRESS A TO LOG IN!")
