gulp = require 'gulp'
cson = require 'gulp-cson'
jade = require 'gulp-jade-template'
rename = require 'gulp-rename'
fetchMetadata = require './helper/fetchMetadata'
{paths} = require '../gulpfile'

module.exports = ->
  gulp.src 'src/index.cson'
    .pipe cson()
    .pipe fetchMetadata()
    .pipe jade 'src/index.jade'
    .pipe rename
      extname: '.html'
    .pipe gulp.dest paths.dest
