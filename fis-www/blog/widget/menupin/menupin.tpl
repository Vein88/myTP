{%*	
	这个是底部的pin menu部分。 
*%}
<footer class='menu-pin'>
	<nav> <ul>
			<li><i class='icon-share'></i>分享</li>
			<li><a href='#' id='zan'>赞</a></li>
			<li>评论</li>
			<li>我</li>
		</ul>
	</nav>
</footer>

{%script%}	
	var menupin = require('./menupin.js');
	menupin.init();
{%/script%}
