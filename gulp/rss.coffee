gulp = require 'gulp'
feed = require './helper/feedGenerator'
{paths} = require '../gulpfile'

module.exports = ->
  gulp.src 'src/metadata.cson'
    .pipe feed
      title: 'iojs.jp blog'
      description: 'io.js 日本語ローカリゼーション'
      feed_url: 'http://blog.iojs.jp/feed.xml'
      site_url: 'http://blog.iojs.jp'
      image_url: 'http://blog.iojs.jp/logo.png'
      updated: new Date()
    .pipe gulp.dest paths.dest
