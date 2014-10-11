/**
 * Created by ZYW on 2014/10/11.
 */
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
        }
    }
    window.v5Util = v5Util;
})( window , jQuery );

v5Util.countUp(495,'count');
v5Util.countUp(947,'count2');
v5Util.countUp(328,'count3');
v5Util.countUp(10328,'count4');
