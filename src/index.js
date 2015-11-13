import { log, random } from './lib/utils'

let names = ['Guest', 'World', 'Buddy', 'John Doe', 'Jane Doe']
let guest = names[random(0, names.length - 1)]

export let hello = function() {
    log(`Hello ${guest}`)
}

hello()
