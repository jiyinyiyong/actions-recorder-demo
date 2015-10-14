
React = require 'react'
recorder = require 'actions-recorder'
ReactDOM = require 'react-dom'
Immutable = require 'immutable'

updater = require './updater'

require('volubile-ui/ui/index.less')

Page = React.createFactory require './app/page'

recorder.setup
  initial: Immutable.List()
  updater: updater

render = (store, core) ->
  ReactDOM.render Page({store, core}), document.querySelector('.demo')

recorder.request render
recorder.subscribe render
