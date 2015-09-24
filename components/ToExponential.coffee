# File: components/ToExponential.coffee
noflo = require "noflo"

exports.getComponent = ->
  component = new noflo.Component
  component.description = "Converts a number into an exponential notation"
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
          component.outPorts.out.send payload.toExponential()
        else
          component.outPorts.out.send payload.toExponential(numberOfDigits)
      when 'disconnect'
        component.outPorts.out.disconnect()
        numberOfDigits = null
  component.inPorts.add 'digits',
    datatype: 'number'
    description: 'Digits after decimal point. Integer between 0 and 20'
  , (event, payload) ->
    switch event
      when 'data'
        numberOfDigits = payload

  component.outPorts.add 'out', datatype: 'string'

  component # Return new instance
