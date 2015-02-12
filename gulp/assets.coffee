gulp = require 'gulp'
{paths} = require '../gulpfile'

module.exports = ->
  gulp.src paths.assets
    .pipe gulp.dest paths.dest
