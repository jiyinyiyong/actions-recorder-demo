
React = require 'react'
Immutable = require 'immutable'

Devtools = React.createFactory require 'actions-recorder/lib/devtools'
Todolist = React.createFactory require './todolist'

updater = require '../updater'

div = React.createFactory 'div'

module.exports = React.createClass
  displayName: 'app-page'

  propTypes:
    store: React.PropTypes.instanceOf(Immutable.List).isRequired
    core: React.PropTypes.object.isRequired

  renderDevtools: ->
    core = @props.core
    width = 400
    height = 400

    Devtools
      store: @props.store
      updater: updater
      initial: core.initial
      pointer: core.pointer
      isTravelling: core.isTravelling
      records: core.records
      width: width
      height: height

  render: ->
    div style: @styleRoot(),
      Todolist tasks: @props.store
      @renderDevtools()

  styleRoot: ->
    display: 'flex'
    flexDirection: 'row'
