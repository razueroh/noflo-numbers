# File: components/ToString.coffee
noflo = require "noflo"

exports.getComponent = ->
  component = new noflo.Component
  component.description = "Converts a number into a string"
  component.icon = 'cog'

  radix = 10

  # Register ports and event handlers
  component.inPorts.add 'in',
    datatype: 'number'
    description: 'Input number'
  , (event, payload) ->
    switch event
      when 'data'
        component.outPorts.out.send payload.toString(radix)
      when 'disconnect'
        component.outPorts.out.disconnect()
        radix = 10
  component.inPorts.add 'radix',
    datatype: 'number'
    description: 'Base to use. Integer between 2 and 36. Default 10'
  , (event, payload) ->
    switch event
      when 'data'
        radix = payload

  component.outPorts.add 'out', datatype: 'string'

  component # Return new instance
