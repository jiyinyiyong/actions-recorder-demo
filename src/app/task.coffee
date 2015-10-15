
React = require 'react'
Immutable = require 'immutable'

actions = require '../actions'

{div, input} = React.DOM

module.exports = React.createClass
  displayName: 'app-task'

  propTypes:
    task: React.PropTypes.instanceOf(Immutable.Map).isRequired

  onChange: (event) ->
    actions.update @props.task.get('id'), event.target.value

  onToggle: ->
    actions.toggle @props.task.get('id')

  render: ->
    div style: @styleRoot(),
      div style: @styleToggler(@props.task.get('done')), onClick: @onToggle
      input style: @styleInput(), value: @props.task.get('text'), onChange: @onChange

  styleRoot: ->
    display: 'flex'
    flexDirection: 'row'
    marginBottom: '10px'

  styleToggler: (status) ->
    if status
      bg = 'hsla(240,10%,30%,0.7)'
    else
      bg = 'hsla(240,10%,30%,0.3)'
    display: 'inline-block'
    width: '30px'
    height: '30px'
    backgroundColor: bg
    marginRight: '10px'
    cursor: 'pointer'

  styleInput: ->
    verticalAlign: 'midddle'
    lineHeight: '30px'
    border: 'none'
    backgroundColor: 'hsla(0,100%,20%,0.5)'
    color: 'white'
    padding: '0 10px'
    outline: 'none'
    width: '300px'
