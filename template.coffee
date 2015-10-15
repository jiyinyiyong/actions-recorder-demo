
stir = require 'stir-template'
React = require 'react'
ReactDOM = require 'react-dom/server'
recorder = require 'actions-recorder'
Immutable = require 'immutable'

Page = React.createFactory require './src/app/page'

{html, head, title, body, meta, script, link, div, a, span} = stir

line = (text) ->
  div class: 'line', text

module.exports = (data) ->
  recorder.setup
    initial: Immutable.List()
  stir.render stir.doctype(),
    html null,
      head null,
        title null, "Todolist in actions-recorder"
        meta charset: 'utf-8'
        link
          rel: 'icon'
          href: 'http://tp4.sinaimg.cn/5592259015/180/5725970590/1'
        link
          rel: 'stylesheet'
          href: if data.dev then 'src/main.css' else data.style
        script src: data.vendor, defer: true
        script src: data.main, defer: true
      body null,
        div class: 'demo',
          recorder.request (store, core) ->
            ReactDOM.renderToString Page({store, core})
