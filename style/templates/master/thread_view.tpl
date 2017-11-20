<xen:title>{xen:helper threadPrefix, $thread, escaped}{$thread.title}{xen:helper pagenumber, $page}</xen:title>
<xen:h1>{xen:helper threadPrefix, $thread}{$thread.title}</xen:h1>

<xen:description>
	{xen:phrase discussion_in_x_started_by_y_date_z,
		'forum=<a href="{xen:link forums, $forum}">{$forum.title}</a>',
		'name={xen:helper username, $thread}',
		'date=<a href="{xen:link threads, $thread}">{xen:datetime $thread.post_date, html}</a>'}
</xen:description>

<xen:navigation>
	<xen:breadcrumb source="$nodeBreadCrumbs" />
</xen:navigation>

<xen:container var="$head.canonical">
	<link rel="canonical" href="{xen:link 'canonical:threads', $thread, 'page={$page}'}" /></xen:container>
<xen:container var="$head.description">
	<!- <meta name="description" content="{xen:helper snippet, $firstPost.message, 155}" /> -->
	<xen:set var="$cleanDesc"><xen:callback class="MMetaDesc_Listener" method="getCleanDesc" params="{xen:helper snippet, $firstPost.message}"></xen:callback></xen:set>
	<meta name="description" content="{xen:helper snippet, $cleanDesc, 155}" />
	</xen:container>
<xen:container var="$head.openGraph"><xen:include template="open_graph_meta">
		<xen:set var="$url">{xen:link 'canonical:threads', $thread}</xen:set>
		<xen:set var="$title">{xen:helper threadPrefix, $thread, escaped}{$thread.title}</xen:set>
		<!-- <xen:set var="$description">{xen:helper snippet, $firstPost.message, 155}</xen:set> -->
		<xen:set var="$description">{xen:helper snippet, $cleanDesc, 155}</xen:set>
		<xen:set var="$avatar">{xen:helper avatar, $thread, l, 0, 1}</xen:set>
	</xen:include></xen:container>
<xen:container var="$bodyClasses">{xen:helper nodeClasses, $nodeBreadCrumbs, $forum}{xen:if {$xenOptions.selectQuotable}, ' SelectQuotable'}</xen:container>
<xen:container var="$searchBar.thread"><xen:include template="search_bar_thread_only" /></xen:container>
<xen:container var="$searchBar.forum"><xen:include template="search_bar_forum_only" /></xen:container>

<xen:require css="thread_view.css" />

<xen:set var="$threadTagsHtml"><xen:if is="{$xenOptions.enableTagging} AND ({$canEditTags} OR {$thread.tagsList})">
	<xen:include template="helper_tag_list">
		<xen:map from="$thread.tagsList" to="$tags" />
		<xen:set var="$editUrl">{xen:if $canEditTags, {xen:link threads/tags, $thread}}</xen:set>
	</xen:include>
</xen:if></xen:set>

<xen:if is="{$threadTagsHtml} AND {$xenOptions.tagPosition} == 'top'">{xen:raw $threadTagsHtml}</xen:if>

<xen:edithint template="message" />

<xen:if is="{$poll}">
	<xen:include template="poll_block">
		<xen:set var="$options">
			<xen:if is="{$poll.canVote} AND !{$poll.hasVoted}">
				<xen:include template="poll_block_vote" />
			<xen:else />
				<xen:include template="poll_block_result" />
			</xen:if>
		</xen:set>
	</xen:include>
</xen:if>

<xen:if is="{$showPostedNotice}">
	<div class="importantMessage">{xen:phrase message_submitted_displayed_pending_approval}</div>
</xen:if>

<xen:set var="$threadStatusHtml">
	<xen:if hascontent="true">
		<dl class="threadAlerts secondaryContent">
			<dt>{xen:phrase thread_status}:</dt>
			<xen:contentcheck>
				<xen:if is="{$thread.discussion_state} == 'deleted'">
					<dd class="deletedAlert">
						<span class="icon Tooltip" title="{xen:phrase deleted}" data-tipclass="iconTip"></span>
							{xen:phrase removed_from_public_view}</dd>
				<xen:elseif is="{$thread.discussion_state} == 'moderated'" />
					<dd class="moderatedAlert">
						<span class="icon Tooltip" title="{xen:phrase awaiting_moderation}" data-tipclass="iconTip"></span>
							{xen:phrase awaiting_moderation_before_being_displayed_publicly}</dd>
				</xen:if>
	
				<xen:if is="!{$thread.discussion_open}">
					<dd class="lockedAlert">
						<span class="icon Tooltip" title="{xen:phrase locked}" data-tipclass="iconTip"></span>
							{xen:phrase not_open_for_further_replies}</dd>
				</xen:if>
			</xen:contentcheck>
		</dl>
	</xen:if>
</xen:set>
{xen:raw $threadStatusHtml}

<xen:hook name="thread_view_pagenav_before" params="{xen:array 'thread={$thread}'}" />

<div class="pageNavLinkGroup">
	<div class="linkGroup SelectionCountContainer">
		<xen:if hascontent="true">
			<div class="Popup">
				<a rel="Menu">{xen:phrase thread_tools}</a>
				<div class="Menu">
				<xen:contentcheck>
					<xen:if hascontent="true">
					<div class="primaryContent menuHeader"><h3>{xen:phrase thread_tools}</h3></div>
					<ul class="secondaryContent blockLinksList">
						<xen:contentcheck>
							<xen:if is="{$canEditThread}">
								<li><a href="{xen:link 'threads/edit', $thread}" class="OverlayTrigger">{xen:phrase edit_thread}</a></li>
							<xen:elseif is="{$canEditTitle}" />
								<li><a href="{xen:link threads/edit-title, $thread}" class="OverlayTrigger">{xen:phrase edit_title}</a></li>
							</xen:if>
							<xen:if is="{$canAddPoll}">
								<li><a href="{xen:link 'threads/poll/add', $thread}">{xen:phrase add_poll}</a></li>
							</xen:if>
							<xen:if is="{$canDeleteThread}">
								<li><a href="{xen:link 'threads/delete', $thread}" class="OverlayTrigger">{xen:phrase delete_thread}</a></li>
							</xen:if>
							<xen:if is="{$canMoveThread}">
								<li><a href="{xen:link 'threads/move', $thread}" class="OverlayTrigger">{xen:phrase move_thread}</a></li>
							</xen:if>
							<xen:if is="{$canReplyBan}">
								<li><a href="{xen:link 'threads/reply-bans', $thread}" class="OverlayTrigger">{xen:phrase manage_reply_bans}</a></li>
							</xen:if>
							<xen:if is="{$canViewModeratorLog}">
								<li><a href="{xen:link 'threads/moderator-actions', $thread}" class="OverlayTrigger">{xen:phrase moderator_actions}</a></li>
							</xen:if>
							<xen:if is="{$deletedPosts}">
								<li><a href="{xen:link threads/show-posts, $thread, 'page={$page}'}" class="MessageLoader" data-messageSelector="#messageList .message.deleted.placeholder">{xen:phrase show_deleted_posts}</a></li>
							</xen:if>
							<xen:hook name="thread_view_tools_links" params="{xen:array 'thread={$thread}'}" />
						</xen:contentcheck>
					</ul>
					</xen:if>
					<xen:if hascontent="true">
					<form action="{xen:link threads/quick-update, $thread}" method="post" class="AutoValidator">
						<ul class="secondaryContent blockLinksList checkboxColumns">
						<xen:contentcheck>
							<xen:if is="{$canLockUnlockThread}">
							<li><label><input type="checkbox" name="discussion_open" value="1" class="SubmitOnChange" {xen:checked $thread.discussion_open} />
								{xen:phrase open_thread}</label>
								<input type="hidden" name="set[discussion_open]" value="1" /></li></xen:if>
							<xen:if is="{$canStickUnstickThread}"> 
							<li><label><input type="checkbox" name="sticky" value="1" class="SubmitOnChange" {xen:checked $thread.sticky} />
								{xen:phrase sticky}</label>
								<input type="hidden" name="set[sticky]" value="1" /></li></xen:if>
						</xen:contentcheck>
						</ul>
						<input type="hidden" name="_xfToken" value="{$visitor.csrf_token_page}" />
					</form>
					</xen:if>
					<xen:if is="{$thread.canInlineMod}">
					<form action="{xen:link inline-mod/thread/switch}" method="post" class="InlineModForm sectionFooter" id="threadViewThreadCheck"
						data-cookieName="threads">
						<label><input type="checkbox" name="threads[]" value="{$thread.thread_id}" class="InlineModCheck" /> {xen:phrase select_for_thread_moderation}</label>
						<input type="hidden" name="_xfToken" value="{$visitor.csrf_token_page}" />
					</form>
					</xen:if>
				</xen:contentcheck>
				</div>
			</div>
		</xen:if>
		<xen:if is="{$canWatchThread}">
			<a href="{xen:link 'threads/watch-confirm', $thread}" class="OverlayTrigger" data-cacheOverlay="false">{xen:if $thread.thread_is_watched, '{xen:phrase unwatch_thread}', '{xen:phrase watch_thread}'}</a>
		</xen:if>
	</div>

	<xen:pagenav link="threads" linkdata="{$thread}"
		page="{$page}" perpage="{$postsPerPage}" total="{$totalPosts}"
		unreadlink="{$unreadLink}" />
</div>

<xen:include template="ad_thread_view_above_messages" />

<xen:hook name="thread_view_form_before" params="{xen:array 'thread={$thread}'}" />

<form action="{xen:link 'inline-mod/post/switch'}" method="post"
	class="InlineModForm section"
	data-cookieName="posts"
	data-controls="#InlineModControls"
	data-imodOptions="#ModerationSelect option">

	<ol class="messageList" id="messageList">
		<xen:foreach loop="$posts" value="$post">
			<xen:if is="{$post.message_state} == 'deleted'">
				<xen:include template="post_deleted_placeholder" />
			<xen:else />
				<xen:include template="post" />
			</xen:if>
		</xen:foreach>
		<xen:edithint template="attached_files" />
	</ol>

	<xen:if is="{$inlineModOptions}">
		<div class="sectionFooter InlineMod Hide">
			<label for="ModerationSelect">{xen:phrase perform_action_with_selected_posts}...</label>

			<xen:include template="inline_mod_controls_post" />
		</div>
	</xen:if>

	<input type="hidden" name="_xfToken" value="{$visitor.csrf_token_page}" />

</form>

	<div class="pageNavLinkGroup">
			<xen:if is="{$canQuickReply}">
				<xen:if is="{$postsRemaining}">
					<div class="linkGroup">
						<xen:if is="{$postsRemaining} == 1">
							<a href="{xen:link threads, $thread, 'page={xen:calc "{$page} + 1"}'}" class="postsRemaining">{xen:phrase 1_more_message}...</a>
						<xen:else />
							<a href="{xen:link threads, $thread, 'page={xen:calc "{$page} + 1"}'}" class="postsRemaining">{xen:phrase x_more_messages, 'count={xen:number $postsRemaining}'}...</a>
						</xen:if>
					</div>
				</xen:if>
			<xen:else />
				<div class="linkGroup">
					<xen:if is="{$canReply}">
						<a href="{xen:link 'threads/reply', $thread}" class="callToAction"><span>{xen:phrase reply_to_thread}</span></a>
					<xen:elseif is="{$visitor.user_id}" />
						<span class="element">({xen:phrase no_permission_to_reply})</span>
					<xen:else />
						<label for="LoginControl"><a href="{xen:link login}" class="concealed element">({xen:phrase log_in_or_sign_up_to_reply})</a></label>
					</xen:if>
				</div>
			</xen:if>
			<div class="linkGroup"{xen:if '!{$ignoredNames}', ' style="display: none"'}><a href="javascript:" class="muted JsOnly DisplayIgnoredContent Tooltip" title="{xen:phrase show_hidden_content_by_x, "names={xen:helper implode, $ignoredNames, ', '}"}">{xen:phrase show_ignored_content}</a></div>

			<xen:pagenav link="threads" linkdata="{$thread}"
				page="{$page}" perpage="{$postsPerPage}" total="{$totalPosts}"
				unreadlink="{$unreadLink}"
			/>
	</div>

<xen:include template="ad_thread_view_below_messages" />

<xen:hook name="thread_view_qr_before" params="{xen:array 'thread={$thread}'}" />

<xen:if is="{$canQuickReply}">
	<xen:include template="quick_reply">
		<xen:set var="$formAction">{xen:link 'threads/add-reply', $thread}</xen:set>
		<xen:set var="$lastDate">{$lastPost.post_date}</xen:set>
		<xen:set var="$lastKnownDate">{$thread.last_post_date}</xen:set>
		<xen:set var="$showMoreOptions">1</xen:set>
		<xen:set var="$multiQuoteAction">{xen:link 'threads/multi-quote', $thread, 'formId=#QuickReply'}</xen:set>
	</xen:include>
</xen:if>

<xen:hook name="thread_view_qr_after" params="{xen:array 'thread={$thread}'}" />

<xen:if is="{$threadTagsHtml} AND {$xenOptions.tagPosition} == 'bottom'">{xen:raw $threadTagsHtml}</xen:if>

{xen:raw $threadStatusHtml}

<xen:include template="share_page">
	<xen:set var="$url">{xen:link 'canonical:threads', $thread}</xen:set>
</xen:include>
