<xen:title>{xen:phrase create_thread}</xen:title>

<xen:if is="{$forum.description} AND @threadListDescriptions">
	<xen:description class="baseHtml">{xen:raw $forum.description}</xen:description>
</xen:if>

<xen:navigation>
	<xen:breadcrumb source="$nodeBreadCrumbs" />
</xen:navigation>

<xen:require js="js/xenforo/discussion.js" />

<xen:container var="$head.robots">
	<meta name="robots" content="noindex" /></xen:container>
<xen:container var="$bodyClasses">{xen:helper nodeClasses, $nodeBreadCrumbs, $forum}</xen:container>
<xen:container var="$searchBar.forum"><xen:include template="search_bar_forum_only" /></xen:container>

<form action="{xen:link 'forums/add-thread', $forum}" method="post" id="ThreadCreate"
	class="xenForm Preview AutoValidator"
	data-previewUrl="{xen:link 'forums/create-thread/preview', $forum}"
	data-redirect="on"
>
	<xen:hook name="thread_create">

	<xen:if is="{$visitor.user_id} == 0">
		<dl class="ctrlUnit">
			<dt><label for="ctrl_guestUsername">{xen:phrase name}:</label></dt>
			<dd><input type="text" name="_guestUsername" value="{$visitor.username}" class="textCtrl" /></dd>
		</dl>
	
		<!-- slot: after_guest -->
	</xen:if>

	<xen:include template="helper_captcha_unit" />

	<fieldset>
		<xen:include template="title_prefix_edit">
			<xen:set var="$selectedPrefix">{$prefixId}</xen:set>
			<xen:set var="$idSuffix">thread_create</xen:set>
		</xen:include>
	
		<dl class="ctrlUnit fullWidth surplusLabel">
			<dt><label for="ctrl_title_thread_create">{xen:phrase title}:</label></dt>
			<dd><input type="text" name="title" class="textCtrl titleCtrl" id="ctrl_title_thread_create" maxlength="100" autofocus="true"
				placeholder="{xen:phrase thread_title}..." value="{$title}"
				data-liveTitleTemplate="{xen:phrase create_thread}: <em>%s</em>" /></dd>
		</dl>

		<xen:hook name="thread_create_fields_main" params="{xen:array 'forum={$forum}'}" />

		<dl class="ctrlUnit fullWidth">
			<dt></dt>
			<dd>{xen:raw $editorTemplate}</dd>
		</dl>
	</fieldset>
	
	<!-- slot: after_editor -->
	
	<xen:if is="{$canEditTags}">
		<xen:require js="js/xenforo/tag.js" />
		<dl class="ctrlUnit">
			<dt>{xen:phrase tags}:</dt>
			<dd>
				<input type="text" name="tags" value="{$tags}" class="textCtrl TagInput" data-extra-class="verticalShift" />
				<p class="explain">
					{xen:phrase multiple_tags_may_be_separated_by_commas}
					<xen:if is="{$forum.min_tags}">{xen:phrase you_must_specify_at_least_x_tags, 'min={xen:number $forum.min_tags}'}</xen:if>
				</p>
			</dd>
		</dl>
	</xen:if>

	<dl class="ctrlUnit submitUnit">
		<dt></dt>
		<dd>
			<input type="submit" value="{xen:phrase create_thread}" accesskey="s" class="button primary" />
			<xen:include template="attachment_upload_button" />
			<input type="button" value="{xen:phrase preview}..." class="button PreviewButton JsOnly" />
			
			<xen:if is="{$xenOptions.multiQuote}"><input type="button" class="button JsOnly MultiQuoteWatcher"
				value="{xen:phrase insert_quotes}..."
				style="display: none"
				data-href="{xen:link 'threads/multi-quote', {xen:array 'thread_id=1'}, 'formId=#ThreadCreate'}"
				data-cacheOverlay="false" /></xen:if>
		</dd>
	</dl>

	<xen:if is="{$attachmentParams}">
		<dl class="ctrlUnit AttachedFilesUnit">
			<dt>{xen:phrase attached_files}:</dt>
			<dd><xen:include template="attachment_editor">
				<xen:set var="$attachments" value="{$attachmentParams.attachments}" />
			</xen:include></dd>
		</dl>
		
		<!-- slot: after_attachment -->
	</xen:if>
	
	<xen:if is="{$visitor.user_id}">
		<fieldset>
			<dl class="ctrlUnit">
				<dt>{xen:phrase options}:</dt>
				<dd><ul>
					<li><xen:include template="helper_thread_watch_input" /></li>
				</ul></dd>
			</dl>
	
			<xen:include template="thread_fields_status" />
		</fieldset>
		
		<!-- slot: after_options -->
	</xen:if>

	<xen:hook name="thread_create_fields_extra" params="{xen:array 'forum={$forum}'}" />
	
	<xen:if is="{$canPostPoll}">
		<h3 class="textHeading">{xen:phrase post_poll}</h3>
		<xen:include template="helper_poll_create" />
	</xen:if>
	
	</xen:hook>

	<xen:if is="{$visitor.user_id} OR {$canPostPoll}">
		<dl class="ctrlUnit submitUnit">
			<dt></dt>
			<dd>
				<input type="submit" value="{xen:phrase create_thread}" class="button primary" />
				<input type="button" value="{xen:phrase preview}..." class="button PreviewButton JsOnly" />
			</dd>
		</dl>
	</xen:if>

	<input type="hidden" name="_xfToken" value="{$visitor.csrf_token_page}" />
</form>

<xen:comment><xen:include template="editor" /></xen:comment>
