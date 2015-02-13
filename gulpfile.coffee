gulp = require 'gulp'
conn = require 'gulp-connect'
deploy = require 'gulp-gh-pages'

exports.paths = paths =
  assets: ['src/CNAME', 'src/*.png']
  posts: 'articles/weekly/*.md'
  styl: 'src/*.styl'
  dest: 'build/'

[
  'article'
  'assets'
  'styl'
  'toppage'
  'rss'
].forEach (name)-> gulp.task name, require "./gulp/#{name}"

gulp.task 'default', ['assets', 'article', 'toppage', 'rss', 'styl']
gulp.task 'watch', ['default'], ->
  gulp.watch paths.styl, ['styl']
  conn.server
    root: 'build'

gulp.task 'deploy', ->
  gulp.src './build/*'
    .pipe deploy
      cacheDir: 'tmp'
