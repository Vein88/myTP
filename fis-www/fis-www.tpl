{%*
    
    调用本widget的方法 
    {%widget name="{{-namespace-}}:widget/{{-file.basename-}}/{{-file.basename-}}.tpl"%}
    
*%}

<div>
It's widget
</div>


{%script%}
var h = require('./fis-www.js');
var w = h.init();
{%/script%}