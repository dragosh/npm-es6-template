/**
* ------------------------------------------------------------------------
* Utility module
* ------------------------------------------------------------------------
*/
let log = (...args) => console.log.apply(console, args)

let sum = (...args) => args.reduce( (prev, next) => prev + next )

export { sum , log}
