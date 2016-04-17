<li class="panel Notice DismissParent notice_{$noticeId} {$notice.visibility}" data-notice="{$noticeId}">
	<xen:if is="{$notice.imageUrl}">
		<div class="blockImage {$notice.display_image}">
			<img src="{$notice.imageUrl}" alt="" />
		</div>
	</xen:if>
	<div class="{xen:if {$notice.wrap}, 'baseHtml noticeContent'}{xen:if '{$notice.imageUrl}', ' hasImage'}">{xen:raw $content}</div>
	
	<xen:if is="{$notice.dismissible}">
		<a href="{xen:link account/dismiss-notice, '', 'notice_id={$noticeId}'}"
			title="{xen:phrase dismiss_notice}" class="DismissCtrl Tooltip" data-offsetx="7" data-tipclass="flipped"><i class="fa fa-times"></i></a></xen:if>
</li>
