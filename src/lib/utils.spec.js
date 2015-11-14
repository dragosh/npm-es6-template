
import { expect, should } from 'chai'
import { sum } from './utils'

describe('Utils sum', () => {
    it('should sum with one argument', () => {
        expect(sum(2)).to.equal(2);
    })
    it('should sum with multiple arguments', () => {
        expect(sum(2, 3)).to.equal(5);
    })
})
