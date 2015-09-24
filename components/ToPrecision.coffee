# File: components/ToPrecision.coffee
noflo = require "noflo"

exports.getComponent = ->
  component = new noflo.Component
  component.description = "Formats a number to a specified length"
  component.icon = 'cog'

  numberOfDigits = null

  # Register ports and event handlers
  component.inPorts.add 'in',
    datatype: 'number'
    description: 'Input number'
  , (event, payload) ->
    switch event
      when 'data'
        if numberOfDigits is null
          component.outPorts.out.send payload.toPrecision()
        else
          component.outPorts.out.send payload.toPrecision(numberOfDigits)
      when 'disconnect'
        component.outPorts.out.disconnect()
        numberOfDigits = null
  component.inPorts.add 'digits',
    datatype: 'number'
    description: 'Number of digits. Integer between 1 and 21'
  , (event, payload) ->
    switch event
      when 'data'
        numberOfDigits = payload

  component.outPorts.add 'out', datatype: 'string'

  component # Return new instance
