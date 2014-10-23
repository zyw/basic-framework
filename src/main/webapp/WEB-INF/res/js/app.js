/**
 * Created by ZYW on 2014/10/11.
 */
/*! iCheck v1.0.2 by Damir Sultanov, http://git.io/arlzeA, MIT Licensed */
(function(f){function A(a,b,d){var c=a[0],g=/er/.test(d)?_indeterminate:/bl/.test(d)?n:k,e=d==_update?{checked:c[k],disabled:c[n],indeterminate:"true"==a.attr(_indeterminate)||"false"==a.attr(_determinate)}:c[g];if(/^(ch|di|in)/.test(d)&&!e)x(a,g);else if(/^(un|en|de)/.test(d)&&e)q(a,g);else if(d==_update)for(var f in e)e[f]?x(a,f,!0):q(a,f,!0);else if(!b||"toggle"==d){if(!b)a[_callback]("ifClicked");e?c[_type]!==r&&q(a,g):x(a,g)}}function x(a,b,d){var c=a[0],g=a.parent(),e=b==k,u=b==_indeterminate,
    v=b==n,s=u?_determinate:e?y:"enabled",F=l(a,s+t(c[_type])),B=l(a,b+t(c[_type]));if(!0!==c[b]){if(!d&&b==k&&c[_type]==r&&c.name){var w=a.closest("form"),p='input[name="'+c.name+'"]',p=w.length?w.find(p):f(p);p.each(function(){this!==c&&f(this).data(m)&&q(f(this),b)})}u?(c[b]=!0,c[k]&&q(a,k,"force")):(d||(c[b]=!0),e&&c[_indeterminate]&&q(a,_indeterminate,!1));D(a,e,b,d)}c[n]&&l(a,_cursor,!0)&&g.find("."+C).css(_cursor,"default");g[_add](B||l(a,b)||"");g.attr("role")&&!u&&g.attr("aria-"+(v?n:k),"true");
    g[_remove](F||l(a,s)||"")}function q(a,b,d){var c=a[0],g=a.parent(),e=b==k,f=b==_indeterminate,m=b==n,s=f?_determinate:e?y:"enabled",q=l(a,s+t(c[_type])),r=l(a,b+t(c[_type]));if(!1!==c[b]){if(f||!d||"force"==d)c[b]=!1;D(a,e,s,d)}!c[n]&&l(a,_cursor,!0)&&g.find("."+C).css(_cursor,"pointer");g[_remove](r||l(a,b)||"");g.attr("role")&&!f&&g.attr("aria-"+(m?n:k),"false");g[_add](q||l(a,s)||"")}function E(a,b){if(a.data(m)){a.parent().html(a.attr("style",a.data(m).s||""));if(b)a[_callback](b);a.off(".i").unwrap();
    f(_label+'[for="'+a[0].id+'"]').add(a.closest(_label)).off(".i")}}function l(a,b,f){if(a.data(m))return a.data(m).o[b+(f?"":"Class")]}function t(a){return a.charAt(0).toUpperCase()+a.slice(1)}function D(a,b,f,c){if(!c){if(b)a[_callback]("ifToggled");a[_callback]("ifChanged")[_callback]("if"+t(f))}}var m="iCheck",C=m+"-helper",r="radio",k="checked",y="un"+k,n="disabled";_determinate="determinate";_indeterminate="in"+_determinate;_update="update";_type="type";_click="click";_touch="touchbegin.i touchend.i";
    _add="addClass";_remove="removeClass";_callback="trigger";_label="label";_cursor="cursor";_mobile=/ipad|iphone|ipod|android|blackberry|windows phone|opera mini|silk/i.test(navigator.userAgent);f.fn[m]=function(a,b){var d='input[type="checkbox"], input[type="'+r+'"]',c=f(),g=function(a){a.each(function(){var a=f(this);c=a.is(d)?c.add(a):c.add(a.find(d))})};if(/^(check|uncheck|toggle|indeterminate|determinate|disable|enable|update|destroy)$/i.test(a))return a=a.toLowerCase(),g(this),c.each(function(){var c=
        f(this);"destroy"==a?E(c,"ifDestroyed"):A(c,!0,a);f.isFunction(b)&&b()});if("object"!=typeof a&&a)return this;var e=f.extend({checkedClass:k,disabledClass:n,indeterminateClass:_indeterminate,labelHover:!0},a),l=e.handle,v=e.hoverClass||"hover",s=e.focusClass||"focus",t=e.activeClass||"active",B=!!e.labelHover,w=e.labelHoverClass||"hover",p=(""+e.increaseArea).replace("%","")|0;if("checkbox"==l||l==r)d='input[type="'+l+'"]';-50>p&&(p=-50);g(this);return c.each(function(){var a=f(this);E(a);var c=this,
        b=c.id,g=-p+"%",d=100+2*p+"%",d={position:"absolute",top:g,left:g,display:"block",width:d,height:d,margin:0,padding:0,background:"#fff",border:0,opacity:0},g=_mobile?{position:"absolute",visibility:"hidden"}:p?d:{position:"absolute",opacity:0},l="checkbox"==c[_type]?e.checkboxClass||"icheckbox":e.radioClass||"i"+r,z=f(_label+'[for="'+b+'"]').add(a.closest(_label)),u=!!e.aria,y=m+"-"+Math.random().toString(36).substr(2,6),h='<div class="'+l+'" '+(u?'role="'+c[_type]+'" ':"");u&&z.each(function(){h+=
        'aria-labelledby="';this.id?h+=this.id:(this.id=y,h+=y);h+='"'});h=a.wrap(h+"/>")[_callback]("ifCreated").parent().append(e.insert);d=f('<ins class="'+C+'"/>').css(d).appendTo(h);a.data(m,{o:e,s:a.attr("style")}).css(g);e.inheritClass&&h[_add](c.className||"");e.inheritID&&b&&h.attr("id",m+"-"+b);"static"==h.css("position")&&h.css("position","relative");A(a,!0,_update);if(z.length)z.on(_click+".i mouseover.i mouseout.i "+_touch,function(b){var d=b[_type],e=f(this);if(!c[n]){if(d==_click){if(f(b.target).is("a"))return;
        A(a,!1,!0)}else B&&(/ut|nd/.test(d)?(h[_remove](v),e[_remove](w)):(h[_add](v),e[_add](w)));if(_mobile)b.stopPropagation();else return!1}});a.on(_click+".i focus.i blur.i keyup.i keydown.i keypress.i",function(b){var d=b[_type];b=b.keyCode;if(d==_click)return!1;if("keydown"==d&&32==b)return c[_type]==r&&c[k]||(c[k]?q(a,k):x(a,k)),!1;if("keyup"==d&&c[_type]==r)!c[k]&&x(a,k);else if(/us|ur/.test(d))h["blur"==d?_remove:_add](s)});d.on(_click+" mousedown mouseup mouseover mouseout "+_touch,function(b){var d=
        b[_type],e=/wn|up/.test(d)?t:v;if(!c[n]){if(d==_click)A(a,!1,!0);else{if(/wn|er|in/.test(d))h[_add](e);else h[_remove](e+" "+t);if(z.length&&B&&e==v)z[/ut|nd/.test(d)?_remove:_add](w)}if(_mobile)b.stopPropagation();else return!1}})})}})(window.jQuery||window.Zepto);


/****************************************/
/************   自定义   ******************/
/****************************************/
/*初始化toastr*/
toastr.options = {
    "closeButton": true,
    "debug": false,
    "positionClass": "toast-top-right",
    "onclick": null,
    "showDuration": "300",
    "hideDuration": "1000",
    "timeOut": "5000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
};
$.extend($.validator.messages, {
    required: "必须填写",
    remote: "请修正此栏位",
    email: "请输入有效的电子邮件",
    url: "请输入有效的网址",
    date: "请输入有效的日期",
    dateISO: "请输入有效的日期 (YYYY-MM-DD)",
    number: "请输入正确的数字",
    digits: "只可输入数字",
    creditcard: "请输入有效的信用卡号码",
    equalTo: "你的输入不相同",
    extension: "请输入有效的后缀",
    maxlength: $.validator.format("最多 {0} 个字"),
    minlength: $.validator.format("最少 {0} 个字"),
    rangelength: $.validator.format("请输入长度为 {0} 至 {1} 之間的字串"),
    range: $.validator.format("请输入 {0} 至 {1} 之间的数值"),
    max: $.validator.format("请输入不大于 {0} 的数值"),
    min: $.validator.format("请输入不小于 {0} 的数值")
});

(function( window , $ ){
    'use strict';
    var v5Util = {
        countUp:function(count,selector){
            var div_by = 100,
                speed = Math.round(count / div_by),
                $display = $('.'+selector),
                run_count = 1,
                int_speed = 24;

            var int = setInterval(function() {
                if(run_count < div_by){
                    $display.text(speed * run_count);
                    run_count++;
                } else if(parseInt($display.text()) < count) {
                    var curr_count = parseInt($display.text()) + 1;
                    $display.text(curr_count);
                } else {
                    clearInterval(int);
                }
            }, int_speed);
        },
        activeNav:function(id,label){
            $("#"+id+" a:first").addClass("active");
            if(label === null) return;
            $("#"+id+" ul").css("display","block");
            $("#"+id+" ul li").each(function(i){
                var $label = $(this).find("a");
                if($label.text() === label){
                    $label.parent().addClass("active");
                    return false;
                }
            });
        },
        backToTop:{
            //startline: Integer. Number of pixels from top of doc scrollbar is scrolled before showing control
            //scrollto: Keyword (Integer, or "Scroll_to_Element_ID"). How far to scroll document up when control is clicked on (0=top).
            setting: {startline:100, scrollto: 0, scrollduration:1000, fadeduration:[500, 100]},
            //controlHTML: '<img src="assets/img/up.png" style="width:51px; height:42px" />', //HTML for control, which is auto wrapped in DIV w/ ID="topcontrol"
            controlattrs: {offsetx:5, offsety:5}, //offset of control relative to right/ bottom of window corner
            anchorkeyword: '#top', //Enter href value of HTML anchors on the page that should also act as "Scroll Up" links

            state: {isvisible:false, shouldvisible:false},

            scrollup:function(){
                if (!this.cssfixedsupport) //if control is positioned using JavaScript
                    this.$control.css({opacity:0}) //hide control immediately after clicking it
                var dest=isNaN(this.setting.scrollto)? this.setting.scrollto : parseInt(this.setting.scrollto)
                if (typeof dest=="string" && jQuery('#'+dest).length==1) //check element set by string exists
                    dest=jQuery('#'+dest).offset().top
                else
                    dest=0
                this.$body.animate({scrollTop: dest}, this.setting.scrollduration);
            },

            keepfixed:function(){
                var $window=jQuery(window)
                var controlx=$window.scrollLeft() + $window.width() - this.$control.width() - this.controlattrs.offsetx
                var controly=$window.scrollTop() + $window.height() - this.$control.height() - this.controlattrs.offsety
                this.$control.css({left:controlx+'px', top:controly+'px'})
            },

            togglecontrol:function(){
                var scrolltop=jQuery(window).scrollTop();
                if (!this.cssfixedsupport)
                    this.keepfixed()
                this.state.shouldvisible=(scrolltop>=this.setting.startline)? true : false
                if (this.state.shouldvisible && !this.state.isvisible){
                    this.$control.stop().animate({opacity:1}, this.setting.fadeduration[0])
                    this.state.isvisible=true
                }
                else if (this.state.shouldvisible==false && this.state.isvisible){
                    this.$control.stop().animate({opacity:0}, this.setting.fadeduration[1])
                    this.state.isvisible=false
                }
            },
            builderImg:function(imgUrl){
                return "<img src='"+imgUrl+"' style='width:51px; height:42px' />";
            },
            init:function(imgUrl){
                jQuery(document).ready(function($){
                    var mainobj=v5Util.backToTop;
                    var iebrws=document.all;
                    mainobj.cssfixedsupport=!iebrws || iebrws && document.compatMode=="CSS1Compat" && window.XMLHttpRequest //not IE or IE7+ browsers in standards mode
                    mainobj.$body=(window.opera)? (document.compatMode=="CSS1Compat"? $('html') : $('body')) : $('html,body')
                    mainobj.$control=$('<div id="topcontrol">'+mainobj.builderImg(imgUrl)+'</div>')
                        .css({position:mainobj.cssfixedsupport? 'fixed' : 'absolute', bottom:mainobj.controlattrs.offsety, right:mainobj.controlattrs.offsetx, opacity:0, cursor:'pointer'})
                        .attr({title:'Scroll Back to Top'})
                        .click(function(){mainobj.scrollup(); return false})
                        .appendTo('body');
                    if (document.all && !window.XMLHttpRequest && mainobj.$control.text()!='') //loose check for IE6 and below, plus whether control contains any text
                        mainobj.$control.css({width:mainobj.$control.width()}) //IE6- seems to require an explicit width on a DIV containing text
                    mainobj.togglecontrol();
                    $('a[href="' + mainobj.anchorkeyword +'"]').click(function(){
                        mainobj.scrollup();
                        return false
                    });
                    $(window).bind('scroll resize', function(e){
                        mainobj.togglecontrol()
                    })
                })
            }
        },
        indexInit:function(){
            v5Util.countUp(495,'count');
            v5Util.countUp(947,'count2');
            v5Util.countUp(328,'count3');
            v5Util.countUp(10328,'count4');
        }
    };
    window.v5Util = v5Util;
})( window , jQuery );

$(function(){
    v5Util.indexInit();
    $("input[type='checkbox'], input[type='radio']").iCheck({
        checkboxClass: 'icheckbox_minimal',
        radioClass: 'iradio_minimal'
    });
    $("#batchChecked").on('ifChecked', function(event){
        $('.batch-checked-item').iCheck('check');
    });
    $("#batchChecked").on('ifUnchecked', function(event){
        $('.batch-checked-item').iCheck('uncheck');
    });
});

var Script = function () {

//    $.validator.setDefaults({
//        submitHandler: function(form) {
//            form.submit();
//        }
//    });

    $().ready(function() {
        // validate the comment form when it is submitted


        // validate signup form on keyup and submit
//        $("#signupForm").validate({
//            rules: {
//                firstname: "required",
//                lastname: "required",
//                username: {
//                    required: true,
//                    minlength: 2
//                },
//                password: {
//                    required: true,
//                    minlength: 5
//                },
//                confirm_password: {
//                    required: true,
//                    minlength: 5,
//                    equalTo: "#password"
//                },
//                email: {
//                    required: true,
//                    email: true
//                },
//                topic: {
//                    required: "#newsletter:checked",
//                    minlength: 2
//                },
//                agree: "required"
//            },
//            messages: {
//                firstname: "Please enter your firstname",
//                lastname: "Please enter your lastname",
//                username: {
//                    required: "Please enter a username",
//                    minlength: "Your username must consist of at least 2 characters"
//                },
//                password: {
//                    required: "Please provide a password",
//                    minlength: "Your password must be at least 5 characters long"
//                },
//                confirm_password: {
//                    required: "Please provide a password",
//                    minlength: "Your password must be at least 5 characters long",
//                    equalTo: "Please enter the same password as above"
//                },
//                email: "Please enter a valid email address",
//                agree: "Please accept our policy"
//            }
//        });
//
//        // propose username by combining first- and lastname
//        $("#username").focus(function() {
//            var firstname = $("#firstname").val();
//            var lastname = $("#lastname").val();
//            if(firstname && lastname && !this.value) {
//                this.value = firstname + "." + lastname;
//            }
//        });
//
//        //code to hide topic selection, disable for demo
//        var newsletter = $("#newsletter");
//        // newsletter topics are optional, hide at first
//        var inital = newsletter.is(":checked");
//        var topics = $("#newsletter_topics")[inital ? "removeClass" : "addClass"]("gray");
//        var topicInputs = topics.find("input").attr("disabled", !inital);
//        // show when newsletter is checked
//        newsletter.click(function() {
//            topics[this.checked ? "removeClass" : "addClass"]("gray");
//            topicInputs.attr("disabled", !this.checked);
//        });
    });


}();
