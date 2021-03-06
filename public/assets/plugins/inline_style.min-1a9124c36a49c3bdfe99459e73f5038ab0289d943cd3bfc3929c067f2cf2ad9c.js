/*!
 * froala_editor v2.0.0-rc.3 (https://www.froala.com/wysiwyg-editor/v2.0)
 * License http://editor.froala.com/license
 * Copyright 2014-2015 Froala Labs
 */

!function(a){"use strict";a.extend(a.FroalaEditor.DEFAULTS,{inlineStyles:{"Big Red":"font-size: 20px; color: red;","Small Blue":"font-size: 14px; color: blue;"}}),a.FroalaEditor.PLUGINS.inlineStyle=function(b){function c(c){""!==b.selection.text()?b.html.insert(a.FroalaEditor.START_MARKER+'<span style="'+c+'">'+b.selection.text()+"</span>"+a.FroalaEditor.END_MARKER):b.html.insert('<span style="'+c+'">'+a.FroalaEditor.INVISIBLE_SPACE+a.FroalaEditor.MARKERS+"</span>")}return{apply:c}},a.FroalaEditor.RegisterCommand("inlineStyle",{type:"dropdown",html:function(){var a='<ul class="fr-dropdown-list">',b=this.opts.inlineStyles;for(var c in b)a+='<li><span style="'+b[c]+'"><a class="fr-command" data-cmd="inlineStyle" data-param1="'+b[c]+'" title="'+c+'">'+c+"</a></span></li>";return a+="</ul>"},title:"Inline Style",callback:function(a,b){this.inlineStyle.apply(b)}}),a.FroalaEditor.DefineIcon("inlineStyle",{NAME:"paint-brush"})}(jQuery);
