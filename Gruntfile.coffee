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

    watch:
      w_coffee:
        files: 'public/src/coffee/**/*.coffee'
        tasks: 'coffee'

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
