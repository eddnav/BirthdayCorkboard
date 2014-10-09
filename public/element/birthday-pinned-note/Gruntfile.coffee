module.exports = (grunt) ->

  require('load-grunt-tasks') grunt

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    coffee:
      glob_to_multiple:
        expand: true,
        flatten: false,
        cwd: 'src/coffee/',
        src: ['**/*.coffee'],
        dest: 'js/',
        ext: '.js'
        
    sass:
      dist:
        files:
          'css/style.css': 'src/sass/style.scss'

    watch:
      coffee_src:
        files: 'src/coffee/**/*.coffee'
        tasks: 'coffee'
      sass_src:
        files: 'src/sass/style.scss'
        tasks: 'sass'
    

  grunt.registerTask 'default', 'watch'
