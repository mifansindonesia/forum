<xen:require css="discussion_list.css" />

<xen:if is="{$thread.isDeleted}"><xen:include template="thread_list_item_deleted" /><xen:else />

<li id="thread-{$thread.thread_id}" class="discussionListItem {$thread.discussion_state}{xen:if '!{$thread.discussion_open}', ' locked'}{xen:if {$thread.sticky}, ' sticky'}{xen:if {$thread.isNew}, ' unread'}{xen:if {$thread.prefix_id}, ' prefix{$thread.prefix_id}'}{xen:if {$thread.isIgnored}, ' ignored'} {xen:if $thread.thread_is_watched, threadWatched} {xen:if $thread.forum_is_watched, forumWatched}" data-author="{$thread.username}">

	<div class="listBlock posterAvatar">
		<span class="avatarContainer">
			<xen:avatar user="$thread" size="s" img="true" />
			<xen:if is="{$thread.user_post_count}"><xen:avatar user="$visitor" size="s" img="true" class="miniMe" title="{xen:phrase you_have_posted_x_messages_in_this_thread, 'count={xen:number $thread.user_post_count}'}" /></xen:if>
		</span>
	</div>

	<div class="listBlock main">

		<div class="titleText">
			<xen:if hascontent="true">
				<div class="iconKey">
				<xen:contentcheck>
					<xen:hook name="thread_list_item_icon_key" params="{xen:array 'thread={$thread}'}">
					<xen:if is="{$thread.isModerated}"><span class="moderated" title="{xen:phrase moderated}"><i class="fa fa-shield"></i></span></xen:if>
					<xen:if is="!{$thread.discussion_open}"><span class="locked" title="{xen:phrase locked}"><i class="fa fa-lock"></i></span></xen:if>
					<xen:if is="{$thread.sticky}"><span class="sticky" title="{xen:phrase sticky}"><i class="fa fa-thumb-tack"></i></span></xen:if>
					<xen:if is="{$thread.isRedirect}"><span class="redirect" title="{xen:phrase redirect}"><i class="fa fa-share"></i></span></xen:if>
					<xen:if is="{$thread.thread_is_watched} OR {$thread.forum_is_watched}"><span class="watched" title="{xen:phrase watched}"><i class="fa fa-eye"></i></span></xen:if>
					</xen:hook>
				</xen:contentcheck>
				</div>
			</xen:if>

			<h3 class="title">
				<xen:if is="{$thread.canInlineMod}"><input type="checkbox" name="threads[]" value="{$thread.thread_id}" class="InlineModCheck" id="inlineModCheck-thread-{$thread.thread_id}" data-target="#thread-{$thread.thread_id}" title="{xen:phrase select_thread}: {$thread.title}" /></xen:if>
				<xen:if is="{$showSubscribeOptions}"><input type="checkbox" name="thread_ids[]" value="{$thread.thread_id}" /></xen:if>
				<xen:if is="{$thread.prefix_id}">
					<xen:if is="{$linkPrefix}">
						<a href="{xen:link forums, $forum, 'prefix_id={$thread.prefix_id}'}" class="prefixLink"
							title="{xen:phrase show_only_threads_prefixed_by_x, 'prefix={xen:helper threadPrefix, $thread, plain, ""}'}">{xen:helper threadPrefix, $thread, html, ''}</a>
					<xen:else />
						{xen:helper threadPrefix, $thread}
					</xen:if>
				</xen:if>
				<a href="{xen:link "threads{xen:if '{$thread.isNew} AND {$thread.haveReadData}', '/unread'}", $thread}"
					title="{xen:if '{$thread.isNew} AND {$thread.haveReadData}', {xen:phrase go_to_first_unread_message}}"
					class="{xen:if $thread.hasPreview, PreviewTooltip}"
					data-previewUrl="{xen:if $thread.hasPreview, {xen:link threads/preview, $thread}}">{xen:helper wrap, $thread.title, 50}</a>
				<xen:if is="{$thread.isNew}"><a href="{xen:link threads/unread, $thread}" class="unreadLink" title="{xen:phrase go_to_first_unread_message}"><i class="fa fa-circle"></i></a></xen:if>
			</h3>
			
			<div class="secondRow">
				<div class="posterDate muted">
					<xen:username user="$thread" title="{xen:phrase thread_starter}" /><span class="startDate">,
					<a{xen:if {$visitor.user_id}, ' href="{xen:link threads, $thread}"'} class="faint"><xen:datetime time="$thread.post_date" title="{xen:if {$visitor.user_id}, '{xen:phrase go_to_first_message_in_thread}'}" /></a></span><xen:if is="{$showForumLink}"><span class="containerName">,
					<a href="{xen:link forums, $thread.forum}" class="forumLink">{$thread.forum.title}</a></span></xen:if>

					<xen:if is="{$showLastPageNumbers} AND {$thread.lastPageNumbers}">
						<span class="itemPageNav">
							<span>...</span>
							<xen:foreach loop="$thread.lastPageNumbers" value="$pageNumber">
								<a href="{xen:link threads, $thread, 'page={$pageNumber}'}">{$pageNumber}</a>
							</xen:foreach>
						</span>
					</xen:if>
				</div>

				<div class="controls faint">
					<xen:if is="{$thread.canEditThread}"><a href="javascript:" data-href="{xen:link 'threads/list-item-edit', $thread, 'showForumLink={$showForumLink}'}" class="EditControl JsOnly">{xen:phrase edit}</a></xen:if>
					<xen:if is="{$showSubscribeOptions} AND {$thread.email_subscribe}">{xen:phrase email}</xen:if>
				</div>
			</div>
		</div>
	</div>

	<div class="listBlock stats pairsJustified" title="{xen:phrase members_who_liked_first_message}: {xen:if $thread.isRedirect, '&ndash;', {xen:number $thread.first_post_likes}}">
		<dl class="major"><dt>{xen:phrase replies}:</dt> <dd>{xen:if $thread.isRedirect, '&ndash;', {xen:number $thread.reply_count}}</dd></dl>
		<dl class="minor"><dt>{xen:phrase views}:</dt> <dd>{xen:if $thread.isRedirect, '&ndash;', {xen:number $thread.view_count}}</dd></dl>
	</div>

	<div class="listBlock lastPost">
		<xen:if is="{$thread.isRedirect}">
			<div class="lastPostInfo">{xen:phrase n_a}</div>
		<xen:else />
			<dl class="lastPostInfo">
				<dt><xen:if is="{xen:helper isIgnored, $thread.last_post_user_id}">{xen:phrase ignored_member}<xen:else /><xen:username user="$thread.lastPostInfo" /></xen:if></dt>
				<dd class="muted"><a{xen:if '{$visitor.user_id}', ' href="{xen:link posts, $thread.lastPostInfo}" title="{xen:phrase go_to_last_message}"'} class="dateTime"><xen:datetime time="$thread.lastPostInfo.post_date" /></a></dd>
			</dl>
		</xen:if>
	</div>
</li>

</xen:if>
