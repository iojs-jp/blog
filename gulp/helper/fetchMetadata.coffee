gutil = require 'gulp-util'
through = require 'through2'
fs = require 'fs'
cson = require 'season'
path = require 'path'

module.exports = ->
  transform = (file, encoding, callback)->
    metadata = cson.readFileSync path.resolve(process.cwd(), 'src/metadata.cson')
    index = JSON.parse file.contents.toString()
    res =
      headline: metadata[index.headline]
      contents: index.contents.map (key)-> metadata[key]
    file.contents = new Buffer JSON.stringify res
    callback null, file

  through.obj transform
