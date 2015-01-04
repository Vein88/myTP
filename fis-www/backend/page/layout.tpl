{%html framework='common:static/css/mod.js' %}
	{%head%}	
		<meta charset='utf-8'>
		<title>cms of vein's blog </title>
		{%require name='common:static/css/normalize.css'%}
		{%require name='common:static/bootstrap/css/bootstrap.css' %}
		{%require name='backend:static/css/main.less' %}
		{%require name='common:static/jquery/jquery.js' %}
		{%require name='common:static/bootstrap/js/bootstrap.js' %}
		
		{%block name='header'%} {%/block%}
	{%/head%}	
	{%body%}
		{%block name='body'%} {%/block%}
	{%/body%}
{%/html%}
