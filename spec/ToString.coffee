noflo = require 'noflo'
unless noflo.isBrowser()
  chai = require 'chai' unless chai
  ToString = require '../components/ToString.coffee'
else
  ToString = require 'noflo-numbers/components/ToString.js'

describe 'ToString component', ->
  c = null
  ins = null
  radix = null
  out = null

  beforeEach ->
    c = ToString.getComponent()
    ins = noflo.internalSocket.createSocket()
    radix = noflo.internalSocket.createSocket()
    out = noflo.internalSocket.createSocket()
    c.inPorts.in.attach ins
    c.inPorts.radix.attach radix
    c.outPorts.out.attach out

  describe 'when instantiated', ->
    it 'should have an input port', ->
      chai.expect(c.inPorts.in).to.be.an 'object'
      chai.expect(c.inPorts.radix).to.be.an 'object'
    it 'should have an output port', ->
      chai.expect(c.outPorts.out).to.be.an 'object'

  describe 'converting a number', ->
    it 'test with default radix', ->
      packet = '128'
      out.on 'data', (data) ->
        chai.expect(packet).to.equal data

      ins.connect()
      ins.send 128
      ins.disconnect()

    it 'test with radix 16', ->
      packet = '80'
      out.on 'data', (data) ->
        chai.expect(packet).to.equal data

      radix.send 16

      ins.connect()
      ins.send 128
      ins.disconnect()

    it 'test with radix 8', ->
      packet = '200'
      out.on 'data', (data) ->
        chai.expect(packet).to.equal data

      radix.send 8

      ins.connect()
      ins.send 128
      ins.disconnect()

    it 'test with radix 2', ->
      packet = '10000000'
      out.on 'data', (data) ->
        chai.expect(packet).to.equal data

      radix.send 2

      ins.connect()
      ins.send 128
      ins.disconnect()
