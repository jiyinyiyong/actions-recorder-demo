
React = require 'react'
Immutable = require 'immutable'

Devtools = React.createFactory require 'actions-recorder/lib/devtools'

updater = require '../updater'

div = React.createFactory 'div'

module.exports = React.createClass
  displayName: 'app-page'

  propTypes:
    store: React.PropTypes.instanceOf(Immutable.List).isRequired
    core: React.PropTypes.object.isRequired

  renderDevtools: ->
    core = @props.core

    Devtools
      store: @props.store
      updater: updater
      initial: core.initial
      pointer: core.pointer
      isTravelling: core.isTravelling
      records: core.records
      width: window.innerWidth - 600
      height: window.innerHeight

  render: ->
    div className: 'app-page',
      @renderDevtools()
