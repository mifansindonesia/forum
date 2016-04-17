<xen:require css="node_list.css" />
<xen:require css="node_link.css" />

<li class="node link level_{$level} {xen:if '{$level} == 1 AND !{$renderedChildren}', 'groupNoChildren'} node_{$link.node_id}">

	<xen:if is="{$level} == 1"><div class="categoryStrip"></div></xen:if>
	
	<div class="nodeInfo linkNodeInfo">
		<span class="nodeIcon">@fa_linkicon</span>

		<div class="nodeText">
			<h3 class="nodeTitle"><a href="{xen:link link-forums, $link}" data-description-x="#nodeDescription-{$link.node_id}">{$link.title}</a></h3>
			<xen:if is="{$link.description}"><blockquote class="nodeDescription muted baseHtml" id="nodeDescription-{$link.node_id}">{xen:raw $link.description}</blockquote></xen:if>
		</div>		
	</div>
	
	<xen:if is="{$renderedChildren} AND {$level} == 1">		
		<ol class="nodeList">
			<xen:foreach loop="$renderedChildren" value="$child">{xen:raw $child}</xen:foreach>
		</ol>
	</xen:if>
</li>
