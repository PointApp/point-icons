# http://gruntjs.com/sample-gruntfile

module.exports = (grunt) ->

    grunt.initConfig

        pkg: grunt.file.readJSON('package.json')

        open:
            main:
                path : 'compiled/all/pnt-icons.html'
            folder:
                path : 'src/svg/'

        webfont:
            chrome:
                src: 'src/svg/*.svg'
                dest: 'compiled/chrome/'
                options:
                    font: 'pnt-icons'
                    types: 'woff'
                    embed: true
                    templateOptions:
                        baseClass: 'pnticn'
                        classPrefix: 'pnticn-'
                        mixinPrefix: 'pnticn-'
            all:
                src: 'src/svg/*.svg'
                dest: 'compiled/all/'
                options:
                    font: 'pnt-icons'
                    types: 'eot,woff,ttf'
                    order: 'eot,woff,ttf,svg'
                    embed: true
                    templateOptions:
                        baseClass: 'pnticn'
                        classPrefix: 'pnticn-'
                        mixinPrefix: 'pnticn-'

    #### Plugins ####

    grunt.loadNpmTasks('grunt-open')
    grunt.loadNpmTasks('grunt-webfont')

    ##### Command line tasks ####

    ## `grunt dev` for compiling plugin to /dev, unminified.
    ## Uses configDev. Watches and builds files.
    # Alias default  to dev task. run with `grunt`
    grunt.registerTask 'default', ['webfont']
