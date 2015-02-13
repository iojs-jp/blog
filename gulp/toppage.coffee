gulp = require 'gulp'
cson = require 'gulp-cson'
jade = require 'gulp-jade-template'
rename = require 'gulp-rename'
{paths} = require '../gulpfile'

module.exports = ->
  gulp.src 'src/index.cson'
    .pipe cson()
    .pipe jade 'src/index.jade'
    .pipe rename
      extname: '.html'
    .pipe gulp.dest paths.dest
