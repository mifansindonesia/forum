<xen:require css="node_list.css" />
<xen:require css="node_category.css" />

<li class="node category_forum level_{$level} node_{$category.node_id}">

	<div class="nodeInfo categoryForumNodeInfo {xen:if $category.hasNew, 'unread'}">

		<span class="nodeIcon" title="{xen:if $category.hasNew, '{xen:phrase unread_messages}', ''}">@fa_nodeicon</span>

		<div class="nodeText">
			<h3 class="nodeTitle"><a href="{xen:link categories, $category}" data-description="{xen:if @nodeListDescriptionTooltips, '#nodeDescription-{$category.node_id}'}">{$category.title}</a></h3>

			<xen:if is="{$category.description} AND @nodeListDescriptions">
				<blockquote class="nodeDescription {xen:if @nodeListDescriptionTooltips, nodeDescriptionTooltip} baseHtml" id="nodeDescription-{$category.node_id}">{xen:raw $category.description}</blockquote>
			</xen:if>

			<div class="nodeStats pairsInline">
				<dl><dt>{xen:phrase discussions}:</dt> <dd>{xen:if $category.privateInfo, '&ndash;', {xen:number $category.discussion_count}}</dd></dl>
				<dl><dt>{xen:phrase messages}:</dt> <dd>{xen:if $category.privateInfo, '&ndash;', {xen:number $category.message_count}}</dd></dl>
				<xen:if is="{$renderedChildren} AND @nodeListSubForumPopup">
					<div class="Popup subForumsPopup">
						<a href="{xen:link categories, $category}" rel="Menu" class="cloaked" data-closemenu="true"><span class="dt">{xen:phrase sub_forums}:</span> {xen:number $category.childCount}</a>
						
						<div class="Menu JsOnly subForumsMenu">
							<div class="primaryContent menuHeader">
								<h3>{$category.title}</h3>
								<div class="muted">{xen:phrase sub_forums}</div>
							</div>
							<ol class="secondaryContent blockLinksList">
							<xen:foreach loop="$renderedChildren" value="$child">
								{xen:raw $child}
							</xen:foreach>
							</ol>
						</div>
					</div>
				</xen:if>
			</div>
			
			{xen:raw $nodeExtraHtml}
		</div>

		<xen:if is="{$renderedChildren} AND !@nodeListSubForumPopup">
			<ol class="subForumList">
			<xen:foreach loop="$renderedChildren" value="$child">
				{xen:raw $child}
			</xen:foreach>
			</ol>
		</xen:if>

		<div class="nodeLastPost secondaryContent">
			<xen:if is="{$category.privateInfo}">
				<span class="noMessages muted">({xen:phrase private})</span>
			<xen:elseif is="{$category.lastPost.date}" />
				<span class="lastThreadTitle"><span>{xen:phrase latest}:</span> <a href="{xen:link posts, $category.lastPost}" title="{$category.lastPost.title}">{$category.lastPost.title}</a></span>
				<span class="lastThreadMeta">
					<span class="lastThreadUser"><xen:if is="{xen:helper isIgnored, $category.last_post_user_id}">{xen:phrase ignored_member}<xen:else /><xen:username user="$category.lastPost" /></xen:if>,</span>
					<xen:datetime time="$category.lastPost.date" class="muted lastThreadDate" data-latest="{xen:phrase latest}: " />
				</span>
			<xen:else />
				<span class="noMessages muted">({xen:phrase contains_no_messages})</span>
			</xen:if>
		</div>

	</div>

</li>
