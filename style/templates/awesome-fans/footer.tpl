<xen:edithint template="footer.css" />

<xen:hook name="footer">
<div class="footer">
	<div class="pageWidth">
		<div class="pageContent">
			<xen:if is="{$canChangeStyle} OR {$canChangeLanguage}">
			<dl class="choosers">
				<xen:if is="{$canChangeStyle}">
					<dt>{xen:phrase style}</dt>
					<dd><a href="{xen:link 'misc/style', '', 'redirect={$requestPaths.requestUri}'}" class="OverlayTrigger Tooltip" title="{xen:phrase style_chooser}" rel="nofollow"><i class="fa fa-cogs faa-wrench animated"></i> {$visitorStyle.title}</a></dd>
				</xen:if>
				<xen:if is="{$canChangeLanguage}">
					<dt>{xen:phrase language}</dt>
					<dd><a href="{xen:link 'misc/language', '', 'redirect={$requestPaths.requestUri}'}" class="OverlayTrigger Tooltip" title="{xen:phrase language_chooser}" rel="nofollow"><i class="fa fa-language faa-ring animated"></i> {$visitorLanguage.title}</a></dd>
				</xen:if>
			</dl>
			</xen:if>
			
			<ul class="footerLinks">
			<xen:hook name="footer_links">
				<xen:if is="{$xenOptions.contactUrl.type} === 'default'">
					<li><a href="{xen:link 'misc/contact'}" class="OverlayTrigger Tooltip" data-overlayOptions="{&quot;fixed&quot;:false}" title="{xen:phrase contact_us}"><i class="fa fa-envelope-o faa-horizontal animated"></i><!-- --></a></li>
				<xen:elseif is="{$xenOptions.contactUrl.type} === 'custom'" />
					<li><a href="{$xenOptions.contactUrl.custom}" {xen:if {$xenOptions.contactUrl.overlay}, 'class="OverlayTrigger" data-overlayOptions="{&quot;fixed&quot;:false}"'}><i class="fa fa-envelope"></i> {xen:phrase contact_us}</a></li>
				</xen:if>
				<li><a href="{xen:link help}" class="Tooltip" title="{xen:phrase help}"><i class="fa fa-lightbulb-o faa-pulse animated faa-fast"></i></a></li>
				<xen:if is="{$homeLink}"><li><a href="{$homeLink}" class="homeLink Tooltip" title="{xen:phrase home}"><i class="fa fa-home faa-shake faa-slow animated"></i> </a></li></xen:if>
				<li><a href="{$requestPaths.requestUri}#navigation" class="topLink Tooltip" title="{xen:phrase top}"><i class="fa fa-chevron-circle-up faa-bounce animated"></i></a></li>
				<li><a href="{xen:link forums/-/index.rss}" rel="alternate" target="_blank"
					class="Tooltip" title="{xen:phrase rss}"><i class="fa fa-rss faa-shake animated"></i></a></li>
			</xen:hook>
			</ul>
			
			<span class="helper"></span>
		</div>
	</div>
</div>

<div class="footerLegal">
	<div class="pageWidth">
		<div class="pageContent">
			<ul id="legal">
			<xen:hook name="footer_links_legal">
				<xen:if is="{$tosUrl}"><li><a href="{$tosUrl}">{xen:phrase terms_and_rules}</a></li></xen:if>
				<xen:if is="{$xenOptions.privacyPolicyUrl}"><li><a href="{$xenOptions.privacyPolicyUrl}">{xen:phrase privacy_policy}</a></li></xen:if>
			</xen:hook>
			</ul>
			
			<div id="copyright">{xen:helper copyright} {xen:phrase extra_copyright}<xen:if is="!@fa_branding"> <span class="emoji1c">Original style by <a href="https://pixelexit.com/xenforo-styles/" rel="nofollow" target="_up" title="Free, Premium and Custom Xenforo styles!">PixelExit</a>.</span> <span class="emoji1c"><a href="//forum.mifans.web.id/h/credit/" rel="nofollow" title="Show Credit!">More..</a></span></xen:if></div>
			<xen:hook name="footer_after_copyright" />
		
			<xen:if is="{$debugMode}">
				<xen:if hascontent="true">
					<!-- <dl class="pairsInline debugInfo" title="{$controllerName}-&gt;{$controllerAction}{xen:if $viewName, ' ({$viewName})'}">-->
					<dl class="pairsInline debugInfo" title="Dimuat {xen:phrase x_seconds, 'time={xen:number $page_time, 4}'}. Butuh {xen:phrase x_mb, 'size={xen:number {xen:calc "{$memory_usage} / 1024 / 1024"}, 3}'} RAM & {xen:number {$db_queries}}Q MariaDB">
					<xen:contentcheck>
						<!-- lama
						<xen:if is="{$page_time}"><dt>{xen:phrase timing}:</dt> <dd><a href="{$debug_url}" rel="nofollow">{xen:phrase x_seconds, 'time={xen:number $page_time, 4}'}</a></dd></xen:if>
						<xen:if is="{$memory_usage}"><dt>{xen:phrase memory}:</dt> <dd>{xen:phrase x_mb, 'size={xen:number {xen:calc "{$memory_usage} / 1024 / 1024"}, 3}'}</dd></xen:if>
						<xen:if is="{$db_queries}"><dt>{xen:phrase db_queries}:</dt> <dd>{xen:number {$db_queries}}</dd></xen:if>
						-->
						<xen:if is="{$page_time}"><i class="fa fa-check-square-o faa-flash animated"></i> {xen:phrase x_seconds, 'time={xen:number $page_time, 4}'}</xen:if>
						<xen:if is="{$memory_usage}"> <i class="fa fa-pie-chart faa-float faa-fast animated"></i> {xen:phrase x_mb, 'size={xen:number {xen:calc "{$memory_usage} / 1024 / 1024"}, 3}'}</xen:if>
						<xen:if is="{$db_queries}"> <i class="fa fa-bar-chart faa-float faa-fast animated"></i> {xen:number {$db_queries}}</xen:if>
					</xen:contentcheck>
					</dl>
				</xen:if>
			</xen:if>
			
			<span class="helper"></span>
		</div>
	</div>	
	
</div>
</xen:hook>
<div class="bottomHelper"></div>
