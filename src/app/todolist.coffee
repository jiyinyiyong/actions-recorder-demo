
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

  onArchive: ->
    actions.archive()

  render: ->
    div style: @styleRoot(),
      div style: @styleTable(),
        @props.tasks.map (task) ->
          Task task: task, key: task.get('id')
      div style: @styleFooter(),
        div style: @styleButton(), onClick: @onCreate, 'add'
        div style: @styleButton(), onClick: @onArchive, 'archive'

  styleRoot: ->
    width: '40%'
    padding: '100px 40px'

  styleTable: ->

  styleFooter: ->

  styleButton: ->
    display: 'inline-block'
    padding: '0 10px'
    backgroundColor: 'hsla(0,20%,50%,0.3)'
    color: 'white'
    cursor: 'pointer'
    marginRight: '10px'
