{%html framework='common:static/js/mod.js'%}

	{%head%}
		<meta charset='UTF-8'>
		<meta name='viewport' content='width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no' />
		<meta name='apple-mobile-web-app-capable' content='yes' />
		<meta name='apple-mobile-web-app-status-bar-style' content='black' />
		<meta name='format-detection' name='telephone=no' />
		<title>vein`s blog</title>
		{%require name='common:static/css/normalize.css' %}
		{%require name='blog:static/css/common.less' %}
		{%require name='common:static/jquery/jquery.js'%}

	{%/head%}
	{%body%}
		<header class='title-content'>
			<h1>持之以恒</h1>
		</header>
		<div class='body-container'>
			{%block name='body'%}{%/block%}
		</div>
	{%/body%}
{%/html%}
