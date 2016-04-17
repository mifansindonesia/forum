<xen:require css="message_simple.css" />
<xen:require css="bb_code.css" />

<li id="{$messageId}" class="primaryContent messageSimple {xen:if $message.isDeleted, 'deleted'} {xen:if '{$message.is_staff}', 'staff'} {xen:if $message.isIgnored, ignored}" data-author="{$message.username}">

	<xen:avatar user="$message" size="s" img="true" />
	
	<div class="messageInfo">
		
		<xen:if hascontent="true">
			<ul class="messageNotices">
				<xen:contentcheck>
					<xen:hook name="message_simple_notices" params="{xen:array 'message={$message}'}">
						<xen:if is="{$message.warning_message}">
							<li class="warningNotice"><span class="icon Tooltip" title="{xen:phrase warning}" data-tipclass="iconTip flipped"><i class="fa fa-exclamation-circle"></i></span>{$message.warning_message}</li>
						</xen:if>
						<xen:if is="{$message.isDeleted}">
							<li class="deletedNotice"><span class="icon Tooltip" title="{xen:phrase deleted}" data-tipclass="iconTip flipped"></span>{xen:phrase this_message_has_been_removed_from_public_view}</li>
						<xen:elseif is="{$message.isModerated}" />
							<li class="moderatedNotice"><span class="icon Tooltip" title="{xen:phrase awaiting_moderation}" data-tipclass="iconTip flipped"><i class="fa fa-shield"></i></span>{xen:phrase this_message_is_awaiting_moderator_approval_and_is_invisible_to_normal}</li>
						</xen:if>
						<xen:if is="{$message.isIgnored}">
							<li>{xen:phrase you_are_ignoring_content_by_this_member} <a href="javascript:" class="JsOnly DisplayIgnoredContent">{xen:phrase show_ignored_content}</a></li>
						</xen:if>
					</xen:hook>
				</xen:contentcheck>
			</ul>
		</xen:if>

		<div class="messageContent">
			<xen:if is="{$messagePosterHtml}">
				{xen:raw $messagePosterHtml}
			<xen:else />
				<xen:username user="$message" class="poster" rich="true" />
			</xen:if>
			<article><blockquote class="ugc baseHtml{xen:if $message.isIgnored, ' ignored'}">{xen:helper bodyText, $message.message}</blockquote></article>
		</div>

		{xen:raw $messageAfterTemplate}
	</div>
</li>
