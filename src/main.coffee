
React = require 'react'
recorder = require 'actions-recorder'
ReactDOM = require 'react-dom'
Immutable = require 'immutable'

schema = require './schema'
updater = require './updater'

require('volubile-ui/ui/index.less')

Page = React.createFactory require './app/page'

recorder.setup
  initial: schema.store
  updater: updater

render = (store, core) ->
  ReactDOM.render Page({store, core}), document.querySelector('.demo')

recorder.request render
recorder.subscribe render

if module.hot
  module.hot.accept ['./updater', './schema'], ->
    schema = require './schema'
    updater = require './updater'
    recorder.hotSetup
      initial: schema.store
      updater: updater
  module.hot.accept ['./app/page'], ->

    Page = React.createFactory require './app/page'

    recorder.unsubscribe render
    render = (store, core) ->
      ReactDOM.render Page({store, core}), document.querySelector('.demo')

    recorder.request render
    recorder.subscribe render
