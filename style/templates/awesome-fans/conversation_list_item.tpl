<xen:require css="discussion_list.css" />

<li id="conversation-{$conversation.conversation_id}" class="discussionListItem {xen:if {$conversation.isNew}, 'unread'}" data-author="{$conversation.username}">

	<div class="listBlock posterAvatar"><xen:avatar user="$conversation" size="s" img="true" /></div>			
		
	<div class="listBlock main">
		<div class="titleText">
			<xen:if hascontent="true">
				<div class="iconKey">
				<xen:contentcheck>
					<xen:if is="{$conversation.is_starred}"><a href="{xen:link conversations/starred}"><span class="starred" title="{xen:phrase starred}"><i class="fa fa-star"></i></span></a></xen:if>
				</xen:contentcheck>
				</div>
			</xen:if>

			<h3 class="title">
				<input type="checkbox" name="conversations[]" value="{$conversation.conversation_id}" class="InlineModCheck" id="inlineModCheck-conversation-{$conversation.conversation_id}" data-target="#conversation-{$conversation.conversation_id}" title="{xen:phrase select_conversation}: '{$conversation.title}'" />
				<a href="{xen:link "conversations{xen:if {$conversation.isNew}, '/unread'}", $conversation}">{xen:helper wrap, $conversation.title, 50}</a>
				<xen:if is="{$visitor.user_id}"><a href="{xen:link conversations/toggle-read, $conversation}" class="ReadToggle"
					data-counter="#ConversationsMenu_Counter"
					title="{xen:if {$conversation.isNew}, {xen:phrase mark_as_read}, {xen:phrase mark_as_unread}}"></a></xen:if>
			</h3>

			<div class="secondRow">
				<div class="posterDate muted">
					<xen:username user="$conversation" title="{xen:phrase conversation_starter}" />,
					<xen:foreach loop="$conversation.recipientNames" value="$recipient">
						<xen:if is="{$recipient.user_id} != {$conversation.user_id}"><xen:username user="$recipient">{xen:if $recipient.user_id, $recipient.username, {xen:phrase unknown_member}}</xen:username>,</xen:if>
					</xen:foreach>

					<a href="{xen:link conversations, $conversation}" class="faint"><xen:datetime time="$conversation.start_date" /></a>
									
					<xen:if is="{$conversation.lastPageNumbers}">
						<span class="itemPageNav">
							<span>...</span>
							<xen:foreach loop="$conversation.lastPageNumbers" value="$pageNumber">
								<a href="{xen:link conversations, $conversation, 'page={$pageNumber}'}">{$pageNumber}</a>
							</xen:foreach>
						</span>
					</xen:if>
				</div>
			</div>
		</div>
	</div>
		
	<div class="listBlock stats pairsJustified">
		<dl class="major"><dt>{xen:phrase replies}:</dt> <dd>{xen:number {$conversation.reply_count}}</dd></dl>
		<dl class="minor"><dt>{xen:phrase participants}:</dt> <dd>{xen:number {$conversation.recipient_count}}</dd></dl>
	</div>

	<div class="listBlock lastPost">
		<dl class="lastPostInfo">
			<dt><xen:username user="$conversation.last_message" /></dt>
			<dd class="muted"><a href="{xen:link conversations/message, $conversation, 'message_id={$conversation.last_message_id}'}" class="dateTime"><xen:datetime time="$conversation.last_message_date" /></a></dd>
		</dl>
	</div>
	
</li>
