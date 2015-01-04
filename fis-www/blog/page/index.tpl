{%extends file='blog/layout.tpl'%}

{%block name='body'%}
	{%* 这里是个人心得体会以及一些分享的名言警句。 *%}
	{%widget name='blog:widget/sketch/sketch.tpl'%}
	{%widget name='blog:widget/list/list.tpl'%}
	{%widget name='blog:widget/category/category.tpl'%}

	{%widget name='blog:widget/menupin/menupin.tpl'%}
{%/block%}
