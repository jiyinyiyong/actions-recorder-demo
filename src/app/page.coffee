
React = require 'react'
Immutable = require 'immutable'

Devtools = React.createFactory require 'actions-recorder/lib/devtools'
Todolist = React.createFactory require './todolist'

if typeof window is 'undefined'
  bg = ''
else
  bg = require '../../images/compass.jpg'

div = React.createFactory 'div'

module.exports = React.createClass
  displayName: 'app-page'

  propTypes:
    store: React.PropTypes.instanceOf(Immutable.List).isRequired
    core: React.PropTypes.object.isRequired

  renderDevtools: ->
    core = @props.core

    if typeof window is 'undefined'
      width = 600
      height = 400
    else
      width = window.innerWidth * 0.6
      height = window.innerHeight

    Devtools
      store: @props.store
      updater: core.updater
      initial: core.initial
      pointer: core.pointer
      isTravelling: core.isTravelling
      records: core.records
      width: width
      height: width

  render: ->
    div style: @styleRoot(),
      Todolist tasks: @props.store
      @renderDevtools()

  styleRoot: ->
    display: 'flex'
    flexDirection: 'row'
    backgroundImage: "url(#{bg})"
    backgroundSize: 'cover'
    width: '100%'
    height: '100%'
    position: 'absolute'
