
import { expect, should, assert } from 'chai'
import { sum } from './utils'

describe('Utils sum', () => {
    it('should sum with on argument', () => {
        expect(sum(2)).to.equal(2);
    })
    it('should sum with multiple arguments', () => {
        expect(sum(2, 3)).to.equal(5);
    })
})
