
shortid = require 'shortid'
recorder = require 'actions-recorder'

exports.create = ->
  recorder.dispatch 'todo/create', shortid.generate()

exports.update = (id, text) ->
  recorder.dispatch 'todo/update', {id, text}

exports.toggle = (id) ->
  recorder.dispatch 'todo/update', id

exports.archive = ->
  recorder.dispatch 'todo/archive', id
