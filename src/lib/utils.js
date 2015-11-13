import { random } from 'lodash/number'
let log = (...args) => console.log.apply(console, args)
let sum = (a, b) => a + b
let multiply = (a, b) => a * b
export { random, log , sum }
