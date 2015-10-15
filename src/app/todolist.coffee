
React = require 'react'
Immutable = require 'immutable'

actions = require '../actions'

Task = React.createFactory require './task'

{div} = React.DOM

module.exports = React.createClass
  displayName: 'app-todolist'

  propTypes:
    tasks: React.PropTypes.instanceOf(Immutable.List).isRequired

  onCreate: ->
    actions.create()

  render: ->
    div style: @styleRoot(),
      div style: @styleTable(),
        @props.tasks.map (task) ->
          Task task: task, key: task.get('id')
      div style: @styleFooter(),
        div style: @styleButton(), onClick: @onCreate, 'add'

  styleRoot: ->
    width: 400

  styleTable: ->

  styleFooter: ->

  styleButton: ->
    display: 'inline-block'
    padding: '0 10px'
    backgroundColor: 'hsla(0,80%,80%,0.3)'
    cursor: 'pointer'
