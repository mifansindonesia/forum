<xen:title>{xen:helper resourcePrefix, $resource, escaped}{$resource.title} - {xen:phrase version_history}</xen:title>

<xen:require css="resource_view.css" />

<xen:container var="$head.canonical">
	<link rel="canonical" href="{xen:link 'canonical:resources/history', $resource}" /></xen:container>

<table class="dataTable resourceHistory">
<tr class="dataRow">
	<th class="version">{xen:phrase version}</th>
	<th class="releaseDate">{xen:phrase release_date}</th>
	<xen:if is="!{$resource.is_fileless}"><th class="downloads">{xen:phrase downloads}</th></xen:if>
	<th class="rating">{xen:phrase average_rating}</th>
	<xen:if is="{$resource.canDownload} AND !{$resource.is_fileless}"><th class="download">&nbsp;</th></xen:if>
	<xen:if is="{$canDelete}"><th class="deleteVersion">&nbsp;</th></xen:if>
</tr>
<xen:foreach loop="$versions" value="$version">
<tr class="dataRow {xen:if "{$version.version_state} == 'deleted'", resourceVersionDeleted} {xen:if "{$version.version_state} == 'moderated'", resourceVersionModerated}">
	<td class="version">{$version.version_string}</td>
	<td class="releaseDate"><xen:datetime time="{$version.release_date}" /></td>
	<xen:if is="!{$resource.is_fileless}"><td class="downloads">{xen:number $version.download_count}</td></xen:if>
	<td class="rating"><xen:include template="rating">
		<xen:set var="$rating">{xen:if $version.rating_count, {xen:calc '{$version.rating_sum} / {$version.rating_count}'}, 0}</xen:set>
		<xen:set var="$hint">{xen:if '{$version.rating_count} == 1', {xen:phrase rm_1_rating}, {xen:phrase rm_x_ratings, 'count={$version.rating_count}'}}</xen:set>
	</xen:include></td>
	<xen:if is="{$resource.canDownload} AND !{$resource.is_fileless}"><td class="dataOptions download"><a href="{xen:link resources/download, $resource, 'version={$version.resource_version_id}'}" class="secondaryContent">{xen:phrase download}</a></td></xen:if>
	<xen:if is="{$canDelete}">
		<xen:if is="{$version.canDelete}">
			<td class="delete deleteVersion"><a href="{xen:link resources/delete-version, $resource, 'resource_version_id={$version.resource_version_id}'}" class="OverlayTrigger"><i class="fa fa-times"></i></a></td>
		<xen:else />
			<td class="delete deleteVersion">&nbsp;</td>
		</xen:if>
	</xen:if>
</tr>
</xen:foreach>
</table>
