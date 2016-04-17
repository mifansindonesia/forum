<xen:require css="attachment_editor.css" />

<li id="{xen:if $isTemplate, 'AttachedFileTemplate', 'attachment{$attachment.attachment_id}'}"
	class="AttachedFile {xen:if '{$attachment} and {$attachment.thumbnailUrl}', 'AttachedImage'} secondaryContent">

	<div class="Thumbnail">
		<xen:if is="{$attachment} and{$attachment.thumbnailUrl}">
			<a href="{xen:link attachments, $attachment}" target="_blank"
				data-attachmentId="{$attachment.attachment_id}"
				class="_not_LbTrigger" data-href="{xen:link misc/lightbox}"><img
				src="{$attachment.thumbnailUrl}" alt="{$attachment.filename}"
				class="_not_LbImage" data-src="{xen:link attachments, $attachment, 'embedded=1'}" /></a>
		<xen:else />
			<span class="genericAttachment"><i class="fa fa-file-o"></i></span>
		</xen:if>
	</div>

	<div class="AttachmentText">
		<div class="Filename"><a href="{xen:link attachments, $attachment}" target="_blank">{xen:if $attachment, $attachment.filename, ''}</a></div>
	
		<xen:if is="{$isTemplate}">
			<input type="button" value="{xen:phrase cancel}" class="button smallButton AttachmentCanceller" />
			
			<span class="ProgressMeter"><span class="ProgressGraphic">&nbsp;</span><span class="ProgressCounter">0%</span></span>
		<xen:else />
			<noscript>
				<a href="{xen:link 'attachments/upload', '', '_params={$attachmentParams}', 'attachments='}" target="_blank" class="button Smallbutton">{xen:phrase delete}</a>
			</noscript>
			
			<xen:if is="{$attachment.thumbnailUrl}">
				<div class="label JsOnly">{xen:phrase insert}:</div>
			</xen:if>
			
			<div class="controls JsOnly">				
				<input type="button" value="{xen:phrase delete}" class="button smallButton AttachmentDeleter" data-href="{xen:link 'attachments/delete', $attachment}" />
			
				<xen:if is="{$attachment.thumbnailUrl}">
					<input type="button" name="thumb" value="{xen:phrase thumbnail}" class="button smallButton AttachmentInserter" />
					<input type="button" name="image" value="{xen:phrase full_image}" class="button smallButton AttachmentInserter" />
				</xen:if>
			</div>
		</xen:if>

	</div>
	
</li>
