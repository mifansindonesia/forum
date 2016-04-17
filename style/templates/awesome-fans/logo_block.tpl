<div id="logoBlock">
	<div class="pageWidth">
		<div class="pageContent">
			<xen:include template="ad_header" />
			<xen:hook name="header_logo">
			<div id="logo"><a href="{$logoLink}">
				<span><xen:comment>This span fixes IE vertical positioning</xen:comment></span>
				<xen:if is="@fa_logoastext">
				@fa_logotext<span>@fa_logotextspan</span>
				<xen:else />
				<img src="@headerLogoPath" alt="{$xenOptions.boardTitle}" />
				</xen:if>
			</a></div>
			</xen:hook>
			<span class="helper"></span>
		</div>
	</div>
</div>
