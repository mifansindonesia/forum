<xen:require css="discussion_list.css" />

<li id="thread-{$thread.thread_id}" class="discussionListItem {$thread.discussion_state}{xen:if {$thread.isNew}, ' new'}{xen:if {$thread.prefix_id}, ' prefix{$thread.prefix_id}'}{xen:if {$thread.isIgnored}, ' ignored'}" data-author="{$thread.username}">

	<div class="listBlock posterAvatar">
		<xen:avatar user="$thread" size="s" img="true" />
	</div>

	<div class="listBlock main">

		<div class="titleText">
			<xen:if hascontent="true">
				<div class="iconKey">
				<xen:contentcheck>
					<xen:if is="{$thread.discussion_state} == 'moderated'"><span class="moderated" title="{xen:phrase moderated}"><i class="fa fa-shield"></i></span></xen:if>
					<xen:if is="!{$thread.discussion_open}"><span class="locked" title="{xen:phrase locked}"><i class="fa fa-lock"></i></span></xen:if>
					<xen:if is="{$thread.sticky}"><span class="sticky" title="{xen:phrase sticky}"><i class="fa fa-thumb-tack"></i></span></xen:if>
					<xen:if is="{$thread.discussion_type} == 'redirect'"><span class="redirect" title="{xen:phrase redirect}"><i class="fa fa-share"></i></span></xen:if>
				</xen:contentcheck>
				</div>
			</xen:if>

			<h3 class="title muted">
				<xen:if is="{$thread.canInlineMod}"><input type="checkbox" name="threads[]" value="{$thread.thread_id}" class="InlineModCheck" id="inlineModCheck-thread-{$thread.thread_id}" data-target="#thread-{$thread.thread_id}" title="{xen:phrase select_thread}: {$thread.title}" /></xen:if>
				{xen:helper threadPrefix, $thread}
				<label for="inlineModCheck-thread-{$thread.thread_id}">{xen:helper wrap, $thread.title, 50}</label>
			</h3>

			<div class="secondRow">
				<div class="deletionNote">
					{xen:phrase this_thread_started_by_x_has_been_deleted, 'name={xen:helper username, $thread}'}
					<xen:if is="{$thread.delete_username}">
						{xen:phrase deleted_by_x, 'name={xen:helper username, $thread.deleteInfo}'}, <xen:datetime time="{$thread.delete_date}" /><xen:if is="{$thread.delete_reason}">, {xen:phrase reason}: {$thread.delete_reason}</xen:if>.
					</xen:if>
				</div>

				<div class="controls faint">
					<a href="{xen:link threads, $thread}" class="viewLink">{xen:phrase view}</a>
					<xen:if is="{$thread.canEditThread}"><a href="javascript:" data-href="{xen:link 'threads/list-item-edit', $thread}" class="EditControl JsOnly">{xen:phrase edit}</a></xen:if>
				</div>
			</div>
		</div>

	</div>

	<div class="listBlock statsLastPost"></div>

</li>
