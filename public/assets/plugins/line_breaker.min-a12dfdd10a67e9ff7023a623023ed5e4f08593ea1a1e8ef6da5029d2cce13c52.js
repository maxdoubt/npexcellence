/*!
 * froala_editor v2.0.0-rc.3 (https://www.froala.com/wysiwyg-editor/v2.0)
 * License http://editor.froala.com/license
 * Copyright 2014-2015 Froala Labs
 */

!function(a){"use strict";a.extend(a.FroalaEditor.DEFAULTS,{lineBreakerTags:["table","hr","iframe","form","dl"],lineBreakerOffset:10}),a.FroalaEditor.PLUGINS.lineBreaker=function(b){function c(c,d){var e,f,g,h,i,j,k,l;if(null==c)h=d.parent(),i=h.offset().top,k=d.offset().top,e=k-Math.min((k-i)/2,b.opts.lineBreakerOffset),g=h.outerWidth(),f=h.offset().left;else if(null==d)h=c.parent(),j=h.offset().top+h.outerHeight(),l=c.offset().top+c.outerHeight(),e=l+Math.min((j-l)/2,b.opts.lineBreakerOffset),g=h.outerWidth(),f=h.offset().left;else{h=c.parent();var m=c.offset().top+c.height(),o=d.offset().top;if(m>o)return!1;e=(m+o)/2,g=h.outerWidth(),f=h.offset().left}b.opts.iframe&&(f+=b.$iframe.offset().left-a(b.original_window).scrollLeft(),e+=b.$iframe.offset().top-a(b.original_window).scrollTop()),n.css("top",e-b.window.pageYOffset),n.css("left",f-b.window.pageXOffset),n.css("width",g),n.data("tag1",c),n.data("tag2",d),n.show()}function d(a,d){var f,g,h=a.offset().top,i=a.offset().top+a.outerHeight();if(Math.abs(i-d)<=b.opts.lineBreakerOffset||Math.abs(d-h)<=b.opts.lineBreakerOffset)if(Math.abs(i-d)<Math.abs(d-h)){g=a.get(0);for(var j=g.nextSibling;j&&j.nodeType==Node.TEXT_NODE&&0===j.textContent.length;)j=j.nextSibling;j?(f=e(j),f&&c(a,f)):c(a,null)}else g=a.get(0),g.previousSibling?(f=e(g.previousSibling),f&&c(f,a)):c(null,a)}function e(c){if(c){var d=a(c);if(c.nodeType!=Node.TEXT_NODE&&b.opts.lineBreakerTags.indexOf(c.tagName.toLowerCase())>=0)return d;if(d.parents(b.opts.lineBreakerTags.join(",")).length>0)return c=d.parents(b.opts.lineBreakerTags.join(",")).get(0),a(c)}return null}function f(c){p=null,n.hide();var f,g,h,i=null,j=b.document.elementFromPoint(c.pageX-b.window.pageXOffset,c.pageY-b.window.pageYOffset);if(b.node.isElement(j))for(f=1;f<=b.opts.lineBreakerOffset;f++){if(g=b.document.elementFromPoint(c.pageX-b.window.pageXOffset,c.pageY-b.window.pageYOffset-f),g&&!b.node.isElement(g)&&g!=b.$wp.get(0)&&a(g).parents(b.$wp).length){i=e(g);break}if(h=b.document.elementFromPoint(c.pageX-b.window.pageXOffset,c.pageY-b.window.pageYOffset+f),h&&!b.node.isElement(h)&&h!=b.$wp.get(0)&&a(h).parents(b.$wp).length){i=e(h);break}}else i=e(j);i&&d(i,c.pageY)}function g(a){o===!1&&(p&&clearTimeout(p),p=setTimeout(f,30,a))}function h(){p&&clearTimeout(p),n.hide()}function i(){o=!0,h()}function j(){o=!1}function k(c){c.preventDefault(),n.hide();var d=n.data("tag1"),e=n.data("tag2"),f=b.html.defaultTag();null==d?f&&"TD"!=e.parent().get(0).tagName?e.before("<"+f+">"+a.FroalaEditor.MARKERS+"<br></"+f+">"):e.before(a.FroalaEditor.MARKERS+"<br>"):f&&"TD"!=d.parent().get(0).tagName?d.after("<"+f+">"+a.FroalaEditor.MARKERS+"<br></"+f+">"):d.after(a.FroalaEditor.MARKERS+"<br>"),b.selection.restore()}function l(){n=a('<div class="fr-line-breaker"><a role="button" tabindex="-1" title="'+b.language.translate("Break")+'"><i class="fa fa-plus"></i></a></div>'),b.$wp.append(n),b.events.on("destroy",function(){n.html("").removeData().remove()},!0),n.on("mouseleave.linebreaker"+b.id,h),n.on("mousemove",function(a){a.stopPropagation()}),n.on("mousedown","a",function(a){a.stopPropagation()}),n.on("click","a",k),b.events.on("destroy",function(){n.off("mouseleave.linebreaker"),n.off("mousedown"),n.off("mousedown","a"),n.off("click","a")},!0)}function m(){return b.$wp?(l(),o=!1,b.$window.on("mousemove.linebreaker"+b.id,g),a(b.window).on("scroll.linebreaker"+b.id,h),a(b.window).on("mousedown.linebreaker"+b.id,i),a(b.window).on("mouseup.linebreaker"+b.id,j),void b.events.on("destroy",function(){b.$window.off("mousemove.linebreaker"+b.id),a(b.window).off("scroll.linebreaker"+b.id),a(b.window).off("mousedown.linebreaker"+b.id),a(b.window).off("mouseup.linebreaker"+b.id)},!0)):!1}var n,o,p;return{_init:m}}}(jQuery);
