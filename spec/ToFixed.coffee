noflo = require 'noflo'
unless noflo.isBrowser()
  chai = require 'chai' unless chai
  ToFixed = require '../components/ToFixed.coffee'
else
  ToFixed = require 'noflo-numbers/components/ToFixed.js'

describe 'ToFixed component', ->
  c = null
  ins = null
  digits = null
  out = null

  beforeEach ->
    c = ToFixed.getComponent()
    ins = noflo.internalSocket.createSocket()
    digits = noflo.internalSocket.createSocket()
    out = noflo.internalSocket.createSocket()
    c.inPorts.in.attach ins
    c.inPorts.digits.attach digits
    c.outPorts.out.attach out

  describe 'when instantiated', ->
    it 'should have an input port', ->
      chai.expect(c.inPorts.in).to.be.an 'object'
      chai.expect(c.inPorts.digits).to.be.an 'object'
    it 'should have an output port', ->
      chai.expect(c.outPorts.out).to.be.an 'object'

  describe 'converting a number', ->
    it 'test with default digits', ->
      packet = '10'
      out.on 'data', (data) ->
        chai.expect(packet).to.equal data

      ins.connect()
      ins.send 9.656
      ins.disconnect()

    it 'test with 2 digits', ->
      packet = '9.66'
      out.on 'data', (data) ->
        chai.expect(packet).to.equal data

      digits.send 2

      ins.connect()
      ins.send 9.656
      ins.disconnect()

    it 'test with 4 digits', ->
      packet = '9.6560'
      out.on 'data', (data) ->
        chai.expect(packet).to.equal data

      digits.send 4

      ins.connect()
      ins.send 9.656
      ins.disconnect()

    it 'test with 6 digits', ->
      packet = '9.656000'
      out.on 'data', (data) ->
        chai.expect(packet).to.equal data

      digits.send 6

      ins.connect()
      ins.send 9.656
      ins.disconnect()
