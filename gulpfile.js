﻿/*
This file in the main entry point for defining Gulp tasks and using Gulp plugins.
Click here to learn more. http://go.microsoft.com/fwlink/?LinkId=518007
*/
'use strict';
var gulp = require('gulp');
var sass = require('gulp-sass');

gulp.task('default', ['watch-sass']);

gulp.task('sass-compile', function () {
    gulp.src('./css/main.scss')
    .pipe(sass())
    .pipe(gulp.dest('./css/'))
});

gulp.task('watch-sass', function () {
    gulp.watch('./css/*.scss', ['sass-compile']);
});