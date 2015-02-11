gutil = require 'gulp-util'
through = require 'through2'
fs = require 'fs'

module.exports = ->
  transform = (file, encoding, callback)->
    title = (fs.readFileSync file.path.replace(/html$/, 'md')
      .toString()
      .split('\n')
      .filter (row)-> /^#/.test row
    )[0].replace /^#*\s/, ''
    html = file.contents.toString()
    res =
      body: html
      title: title
    file.contents = new Buffer JSON.stringify res
    callback null, file

  through.obj transform
