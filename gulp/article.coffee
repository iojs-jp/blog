gulp = require 'gulp'
mark = require 'gulp-markdown'
jade = require 'gulp-jade-template'
jadePreprocess = require './helper/jade-preprocess'
{paths} = require '../gulpfile'

module.exports = ->
  gulp.src paths.posts
    .pipe mark()
    .pipe jadePreprocess()
    .pipe jade 'src/page.jade'
    .pipe gulp.dest paths.dest
