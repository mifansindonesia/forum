<xen:if is="{$notices.block}">

<xen:require css="notices.css" />
<xen:require css="panel_scroller.css" />
<xen:edithint template="notice" />

<div class="{xen:if @scrollableNotices, PanelScroller, PanelScrollerOff} Notices" data-vertical="@noticeVertical" data-speed="@noticeSpeed" data-interval="@noticeInterval">
	<div class="scrollContainer">
		<div class="PanelContainer">
			<ol class="Panels">
				<xen:foreach loop="$notices.block" key="$noticeId" value="$notice">
					<xen:include template="notice">
						<xen:set var="$content">{xen:raw $notice.message}</xen:set>
					</xen:include>
				</xen:foreach>
			</ol>
		</div>
	</div>
	
	<xen:if is="@scrollableNotices AND {xen:count $notices.block} > 1"><div class="navContainer">
		<span class="navControls Nav JsOnly">
			<xen:foreach loop="$notices.block" key="$noticeId" value="$notice" i="$i">
				<a id="n{$noticeId}" href="{$requestPaths.requestUri}#n{$noticeId}"{xen:if '{$i} == 1', ' class="current"'}>
					<span class="arrow"><span></span></span>
					<!--{$i} -->{$notice.title}</a>
			</xen:foreach>
		</span>
	</div></xen:if>
</div>

</xen:if>

<xen:if is="{$notices.floating}">
	<xen:require css="notices.css" />
	
	<div class="FloatingContainer Notices">
		<xen:foreach loop="$notices.floating" key="$noticeId" value="$notice">
			<div class="DismissParent Notice notice_{$noticeId} {$notice.visibility}" data-notice="{$noticeId}" data-delay-duration="{$notice.delay_duration}" data-display-duration="{$notice.display_duration}" data-auto-dismiss="{$notice.auto_dismiss}">
				<div class="floatingItem {xen:if '{$notice.display_style} == "custom"', $notice.css_class, $notice.display_style}">
					<xen:if is="{$notice.dismissible}">
						<a href="{xen:link account/dismiss-notice, '', 'notice_id={$noticeId}'}"
							title="{xen:phrase dismiss_notice}" class="DismissCtrl Tooltip" data-offsetx="7" data-tipclass="flipped"><i class="fa fa-times"></i></a></xen:if>
					<xen:if is="{$notice.imageUrl}">
						<div class="floatingImage {$notice.display_image}">
							<img src="{$notice.imageUrl}" alt="" />
						</div>
					</xen:if>
					<div class="{xen:if $notice.imageUrl, hasImage} {xen:if {$notice.wrap}, 'baseHtml noticeContent'}">
						{xen:raw $notice.message}
					</div>
				</div>
			</div>
		</xen:foreach>
	</div>
</xen:if>
