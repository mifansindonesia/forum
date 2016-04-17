<li class="resourceListItem {$resource.resource_state}{xen:if '{$resource.isIgnored} AND !{$showIgnored}', ' ignored'} {xen:if $resource.feature_date, featured}" id="resource-{$resource.resource_id}">
	<div class="listBlock resourceImage">
		<div class="listBlockInner">
			<xen:if is="{$xenOptions.resourceAllowIcons}">
				<a href="{xen:link resources, $resource}" class="resourceIcon"><img src="{xen:helper resourceiconurl, $resource}" alt="" /></a>
				<xen:avatar user="$resource" size="s" img="true" class="creatorMini" />
			<xen:else />
				<xen:avatar user="$resource" size="s" img="true" />
			</xen:if>
		</div>
	</div>
	<div class="listBlock main">
		<div class="listBlockInner">
			<xen:if hascontent="true">
				<div class="iconKey">
				<xen:contentcheck>
					<xen:if is="{$resource.resource_state} == 'moderated'"><span class="moderated" title="{xen:phrase moderated}"><i class="fa fa-shield"></i></span></xen:if>
					<xen:if is="{$resource.resource_state} == 'deleted'"><span class="deleted" title="{xen:phrase deleted}"><i class="fa fa-exclamation-circle"></i></span></xen:if>
				</xen:contentcheck>
				</div>
			</xen:if>
			<xen:if is="{$listItemExtraHtml}"><span class="extra muted">{xen:raw $listItemExtraHtml}</span></xen:if>
			<xen:if is="{$resource.cost}"><span class="cost">{$resource.cost}</span></xen:if>
			<xen:if is="{$resource.feature_date}"><span class="featuredBanner">{xen:phrase featured}</span></xen:if>
			<h3 class="title">
				<xen:if is="{$resource.canInlineMod} AND !{$hideInlineMod} AND !{$showCheckbox}"><input type="checkbox" name="resources[]" value="{$resource.resource_id}" class="InlineModCheck" id="inlineModCheck-resource-{$resource.resource_id}" data-target="#resource-{$resource.resource_id}" title="{xen:phrase select_resource}: '{$resource.title}'" /></xen:if>
				<xen:if is="{$showCheckbox}"><input type="checkbox" name="resource_ids[]" value="{$resource.resource_id}" /> </xen:if><xen:if is="{$resource.prefix_id} AND {$linkPrefixHtml}"><a href="{xen:raw $linkPrefixHtml}" class="prefixLink" title="{xen:phrase show_only_resources_prefixed_by_x, 'prefix={xen:helper resourcePrefix, $resource, escaped, ""}'}">{xen:helper resourcePrefix, $resource}</a><xen:else />{xen:helper resourcePrefix, $resource}</xen:if><a
				href="{xen:link resources, $resource}">{$resource.title}</a>
				<xen:if is="!{$resource.isFilelessNoExternal}"><span class="version">{$resource.version_string}</span></xen:if>
			</h3>
			<div class="resourceDetails muted"><xen:username user="{$resource}" />,
				<a href="{xen:link resources, $resource}" class="faint"><xen:datetime time="{$resource.resource_date}" /></a><xen:comment>
				</xen:comment><xen:if is="{$showCategoryTitle}">, <a href="{xen:link resources/categories, $resource}">{$resource.category_title}</a></xen:if>
			</div>
			<div class="tagLine">
				<xen:if is="{$resource.resource_state} == 'deleted'">
					<span class="deletionNote">{xen:phrase this_resource_has_been_deleted}
						<xen:if is="{$resource.delete_user_id}">
							{xen:phrase deleted_by_x, 'name={xen:helper username, {xen:array "user_id={$resource.delete_user_id}", "username={$resource.delete_username}"}}'}, <xen:datetime time="{$resource.delete_date}" /><xen:if is="{$resource.delete_reason}">, {xen:phrase reason}: {$resource.delete_reason}</xen:if>.
						</xen:if>
					</span>
				<xen:else />
					{$resource.tag_line}
				</xen:if>
			</div>
		</div>
	</div>
	<div class="listBlock resourceStats">
		<div class="listBlockInner">
			<xen:include template="rating">
				<xen:set var="$rating">{$resource.rating_avg}</xen:set>
				<xen:set var="$hint">{xen:if '{$resource.rating_count} == 1', {xen:phrase rm_1_rating}, {xen:phrase rm_x_ratings, 'count={$resource.rating_count}'}}</xen:set>
			</xen:include>
			<div class="pairsJustified">
				<xen:if is="!{$resource.is_fileless}"><dl class="resourceDownloads"><dt>{xen:phrase downloads}:</dt> <dd>{xen:number $resource.download_count}</dd></dl></xen:if>
				<dl class="resourceUpdated"><dt>{xen:phrase updated}:</dt> <dd><a href="{xen:link resources/updates, $resource}" class="concealed"><xen:datetime time="{$resource.last_update}" /></a></dd></dl>
			</div>
		</div>
	</div>
</li>

<xen:require css="resource_list.css" />
