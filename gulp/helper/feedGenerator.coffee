gutil = require 'gulp-util'
through = require 'through2'
RSS = require 'rss'
path = require 'path'
cson = require 'season'

module.exports = (opt)->
  cwd = base = null
  feed = new RSS opt

  transform = (file, encoding, callback)->
    if cwd is null then cwd = file.cwd
    if base is null then base = file.cwd

    metadata = cson.readFileSync file.path
    metalist = Object.keys(metadata).map (key)->
      id: key
      title: metadata[key].title
      description: metadata[key].description
      pubDate: metadata[key].pubDate
    metalist.sort (x, y)-> new Date(y.pubDate) - new Date(x.pubDate)

    for item in metalist.slice(0, 20)
      feed.item
        title: item.title
        description: item.description
        url: "#{opt.site_url}/#{item.id}.html"
        date: new Date item.pubDate

    callback()

  flush = (callback)->
    @push new gutil.File
      cwd: cwd
      base: base
      path: path.resolve cwd, 'feed.xml'
      contents: new Buffer feed.xml()
    callback()

  through.obj transform, flush
