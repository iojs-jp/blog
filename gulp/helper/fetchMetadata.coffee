gutil = require 'gulp-util'
through = require 'through2'
fs = require 'fs'
cson = require 'season'
path = require 'path'
_ = require 'lodash'

module.exports = ->
  transform = (file, encoding, callback)->
    metadata = cson.readFileSync path.resolve(process.cwd(), 'src/metadata.cson')
    index = JSON.parse file.contents.toString()
    res =
      headline: _.extend metadata[index.headline], {id: index.headline}
      contents: index.contents.map (key)-> _.extend metadata[key], {id: key}
    file.contents = new Buffer JSON.stringify res
    callback null, file

  through.obj transform
