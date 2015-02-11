gulp = require 'gulp'
styl = require 'gulp-stylus'
conn = require 'gulp-connect'
deploy = require 'gulp-gh-pages'

exports.paths = paths =
  posts: 'articles/weekly/*.md'
  jade: 'src/*.jade'
  styl: 'src/*.styl'
  coffee: 'src/*.coffee'
  dest: 'build/'

[
  'article'
].forEach (name)-> gulp.task name, require "./gulp/#{name}"

gulp.task 'styl', ->
  gulp.src paths.styl
    .pipe styl()
    .pipe gulp.dest(paths.dest)

gulp.task 'default', ['article', 'styl', 'coffee']
gulp.task 'watch', ['default'], ->
  gulp.watch paths.jade, ['jade']
  gulp.watch paths.styl, ['styl']
  gulp.watch paths.coffee, ['coffee']
  conn.server
    root: 'build'

gulp.task 'deploy', ->
  gulp.src './build/*'
    .pipe deploy
      cacheDir: 'tmp'
