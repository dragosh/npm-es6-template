
import { expect, should } from 'chai'
import { sum } from './utils'

describe('Utils test', () => {
    it('should sum', () => {
        expect(sum(1,3)).to.equal(4);
    })
})
