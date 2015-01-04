{%*
    
    调用本widget的方法 
    {%widget name="blog:widget/lichao/lichao.tpl"%}
    
*%}

<div style="background:red; width:100%;height:400px;">
It's widget
</div>


{%script%}
var h = require('./lichao.js');
var w = h.init();
{%/script%}
