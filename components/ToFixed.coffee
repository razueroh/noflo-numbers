# File: components/ToFixed.coffee
noflo = require "noflo"

exports.getComponent = ->
  component = new noflo.Component
  component.description = "Converts a number into a string,
  keeping a specified number of decimals"
  component.icon = 'cog'

  numberOfDigits = 0

  # Register ports and event handlers
  component.inPorts.add 'in',
    datatype: 'number'
    description: 'Input number'
  , (event, payload) ->
    switch event
      when 'data'
        component.outPorts.out.send payload.toFixed(numberOfDigits)
      when 'disconnect'
        component.outPorts.out.disconnect()
        numberOfDigits = 0
  component.inPorts.add 'digits',
    datatype: 'number'
    description: 'Digits after decimal point. Int from 0 to 20. Default 0'
  , (event, payload) ->
    switch event
      when 'data'
        numberOfDigits = payload

  component.outPorts.add 'out', datatype: 'string'

  component # Return new instance
