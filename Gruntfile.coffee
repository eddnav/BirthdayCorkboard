module.exports = (grunt) ->

  require('load-grunt-tasks') grunt

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    coffee:
      glob_to_multiple:
        expand: true,
        flatten: false,
        cwd: 'public/src/coffee/',
        src: ['**/*.coffee'],
        dest: 'public/app/js/',
        ext: '.js'

    sass:
      dist:
        files:
          'public/app/css/style.css': 'public/src/sass/style.scss'

    watch:
      coffee_src:
        files: 'public/src/coffee/**/*.coffee'
        tasks: 'coffee'
      sass_src:
        files: 'public/src/sass/style.scss'
        tasks: 'sass'

    nodemon: 
      dev: 
        script: 'server.coffee'
        options:
          ignore: ['node_modules/**', 'public/**']

    concurrent: 
      target:
        tasks: ['nodemon', 'watch']
        options: 
          logConcurrentOutput: true 
    

  grunt.registerTask 'default', 'concurrent:target'
