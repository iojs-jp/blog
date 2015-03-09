gulp = require 'gulp'
jade = require 'gulp-jade-template'
cson = require 'gulp-cson'
jadePreprocess = require './helper/jade-preprocess'
{paths} = require '../gulpfile'

module.exports = ->
  gulp.src 'src/metadata.cson'
    .pipe cson()
    .pipe jadePreprocess()
    .pipe jade 'src/page.jade'
    .pipe gulp.dest paths.dest
