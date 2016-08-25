#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require nestedSortable/jquery.mjs.nestedSortable.js
#
#= require angular
#= require angular-route
#= require angular-resource
#= require angular-rails-templates
#= require angular-app
#
#= require bootstrap-sprockets
#= require jquery-fileupload
#= require moment
#= require bootstrap-datetimepicker
#
#= require codemirror
#= require codemirror/modes/xml
#= require froala_editor.min.js
#= require plugins/align.min.js
#= require plugins/char_counter.min.js
#= require plugins/code_view.min.js
#= require plugins/code_beautifier.min.js
#= require plugins/colors.min.js
#= require plugins/emoticons.min.js
#= require plugins/entities.min.js
#= require plugins/file.min.js
#= require plugins/font_family.min.js
#= require plugins/font_size.min.js
#= require plugins/fullscreen.min.js
#= require plugins/image.min.js
#= require plugins/image_manager.min.js
#= require plugins/inline_style.min.js
#= require plugins/line_breaker.min.js
#= require plugins/link.min.js
#= require plugins/lists.min.js
#= require plugins/paragraph_format.min.js
#= require plugins/paragraph_style.min.js
#= require plugins/quote.min.js
#= require plugins/save.min.js
#= require plugins/table.min.js
#= require plugins/url.min.js
#= require plugins/video.min.js
#
#= require core/nav
#
#= require_tree .

#----------------------------------------------------------
# App Configuration
#----------------------------------------------------------

# this code won't work here due to authenticity token

# $(document).on 'page:change', (event) ->
#   $('.editor').froalaEditor(
#     codeBeautifier: true,
#     codeMirror: true,
#     codeMirrorOptions: {
#       indentWithTabs: true,
#       lineNumbers: true,
#       lineWrapping: true,
#       mode : "xml",
#       htmlMode: true,
#       tabMode: 'indent',
#       tabSize: 2,
#       theme: 'night'
#     },
#     fileUploadURL: '/uploads',
#     fileUploadParams: {
#       authenticity_token: ""
#     }
#   )
#   return