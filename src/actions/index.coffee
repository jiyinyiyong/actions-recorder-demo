
todo = require './todo'

exports.create = todo.create
exports.update = todo.update
exports.toggle = todo.toggle
exports.archive = todo.archive

if module.hot
  module.hot.accept ['./todo'], ->
    todo = require './todo'

    exports.create = todo.create
    exports.update = todo.update
    exports.toggle = todo.toggle
    exports.archive = todo.archive
