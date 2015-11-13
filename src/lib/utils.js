// External
import { random } from 'lodash/number'
// Internal
let log = (...args) => console.log.apply(console, args)
let sum = (...args) => args.reduce( (prev, next) => prev + next );
export { random, sum , log }
