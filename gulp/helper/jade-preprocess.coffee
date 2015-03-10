gutil = require 'gulp-util'
through = require 'through2'
fs = require 'fs'
path = require 'path'
marked = require 'marked'

module.exports = ->
  transform = (file, encoding, callback)->
    contents = JSON.parse file.contents.toString()
    filenames = Object.keys contents
    filenames.forEach (filename)=>
      c =
        name: filename
        title: contents[filename].title
        description: contents[filename].description
        pubDate: contents[filename].pubDate
        body: marked fs.readFileSync(path.resolve(file.cwd, "articles/weekly/#{filename}.md")).toString()
      @push new gutil.File
        cwd: file.cwd
        base: file.base
        path: path.resolve file.base, "#{filename}.html"
        contents: new Buffer JSON.stringify c
    callback null

  through.obj transform
