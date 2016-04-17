<xen:require css="resource_view_header.css" />

<div class="resourceInfo">
<xen:hook name="resource_view_header_info">
	<xen:if hascontent="true">
		<ul class="primaryLinks {xen:if '{$resource.is_fileless} AND !{$resource.external_purchase_url}', noButton}">
		<xen:contentcheck>
			<xen:if is="{$resource.external_purchase_url}">
				<xen:if is="!{$resource.canDownload}">
					<li><label class="downloadButton downloadDisabled">
						<span class="inner">
							{xen:phrase buy_now_for_x, 'cost={$resource.cost}'}
							<small class="minorText">{xen:phrase not_available}</small>
						</span>
					</label></li>
				<xen:else />
					<li><label class="downloadButton purchase">
						<a href="{$resource.external_purchase_url}" class="inner">
							{xen:phrase buy_now_for_x, 'cost={$resource.cost}'}
						</a>
					</label></li>
				</xen:if>
			<xen:elseif is="!{$resource.is_fileless}" />
				<li><label class="downloadButton {xen:if '!{$resource.canDownload}', downloadDisabled}">
					<a href="{xen:link resources/download, $resource, 'version={$resource.current_version_id}'}" class="inner">
						<xen:if is="{$resource.canDownload}">{xen:phrase download_now}<xen:else />{xen:phrase download_not_available}</xen:if>
						<xen:if is="{$resource.download_url}">
							<small class="minorText">{xen:phrase via_external_site}</small>
						<xen:else />
							<small class="minorText">{xen:number $resource.attachment.file_size, 'size'} .{$resource.attachment.extension}</small>
						</xen:if>
					</a>
				</label></li>
			</xen:if>

			<xen:hook name="resource_view_header_after_resource_buttons" />
		</xen:contentcheck>
		</ul>
	</xen:if>

	<div class="resourceImage">
		<xen:if is="{$xenOptions.resourceAllowIcons}">
			<img src="{xen:helper resourceiconurl, $resource}" alt="" class="resourceIcon" />
		<xen:else />
			<xen:avatar user="$resource" size="s" img="true" />
		</xen:if>
	</div>

	<h1><xen:if is="{$titleHtml} AND {$titleHtml} != {xen:escape $resource.title}">{xen:raw $titleHtml}<xen:else />{xen:helper resourcePrefix, $resource}{$resource.title}</xen:if> <xen:if is="!{$resource.isFilelessNoExternal}"><span class="muted">{$resource.version_string}</span></xen:if></h1>
	<xen:if is="{$resource.tag_line} OR {$extraDescriptionHtml}"><p class="tagLine muted">{$resource.tag_line}<xen:if is="{$resource.tag_line} AND {$extraDescriptionHtml}"><br /></xen:if>{xen:raw $extraDescriptionHtml}</p></xen:if>
</xen:hook>
</div>

<xen:hook name="resource_view_header_after_info" />

<xen:if is="{$resource.resource_state} != 'visible'">
	<ul class="secondaryContent resourceAlerts">
	<xen:if is="{$resource.resource_state} == 'deleted'">
		<li class="deletedAlert">
			<span class="icon"><i class="fa fa-exclamation-circle"></i></span>
			{xen:phrase this_resource_has_been_deleted}
			<xen:if is="{$resource.delete_user_id}">
				{xen:phrase deleted_by_x, 'name={xen:helper username, {xen:array "user_id={$resource.delete_user_id}", "username={$resource.delete_username}"}}'}, <xen:datetime time="{$resource.delete_date}" /><xen:if is="{$resource.delete_reason}">, {xen:phrase reason}: {$resource.delete_reason}</xen:if>.
			</xen:if>
		</li>
	</xen:if>
	<xen:if is="{$resource.resource_state} == 'moderated'">
		<li class="moderatedAlert">
			<span class="icon"><i class="fa fa-shield"></i></span>
			{xen:phrase this_resource_is_currently_awaiting_approval}
		</li>
	</xen:if>
	</ul>
</xen:if>
