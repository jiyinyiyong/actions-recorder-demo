
todo = require './todo'

module.exports = (store, actionType, actionData) ->
  switch actionType
    when 'todo/create'
      todo.create store, actionData
    when 'todo/update'
      todo.update store, actionData
    when 'todo/toggle'
      todo.toggle store, actionData
    when 'todo/archive'
      todo.archive store, actionData
    else store
