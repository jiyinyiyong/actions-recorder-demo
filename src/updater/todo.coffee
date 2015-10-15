
schema = require '../schema'

exports.create = (store, id) ->
  store.push schema.task.set('id', id)

exports.update = (store, actionData) ->
  id = actionData.get('id')
  text = actionData.get('text')
  store.map (task) ->
    if task.get('id') is id
      task.set 'text', text
    else task

exports.toggle = (store, id) ->
  store.map (task) ->
    if task.get('id') is id
      task.update 'done', (status) ->
        not status
    else task

exports.archive = (store) ->
  store.filterNot (task) ->
    task.get('done')
