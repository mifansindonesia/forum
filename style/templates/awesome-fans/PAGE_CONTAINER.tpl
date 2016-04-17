<!DOCTYPE html><xen:set var="$isResponsive" value="{xen:if '@enableResponsive AND !{$noResponsive}', 1, 0}" />
<html id="XenForo" lang="{$visitorLanguage.language_code}" dir="{$visitorLanguage.text_direction}" class="Public NoJs {xen:if {$visitor.user_id}, 'LoggedIn', 'LoggedOut'} {xen:if {$sidebar}, 'Sidebar', 'NoSidebar'} {xen:if $hasAutoDeferred, RunDeferred} {xen:if $isResponsive, Responsive, NoResponsive}" xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
<xen:hook name="page_container_head">
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
	<xen:if is="{$isResponsive}">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
	</xen:if>
	<xen:if is="{$requestPaths.fullBasePath}">
		<base href="{$requestPaths.fullBasePath}" />
		
	</xen:if>

	<title><xen:if is="{$title}">{xen:raw $title} | {$xenOptions.boardTitle}<xen:else />{$xenOptions.boardTitle}</xen:if></title>
	
	<noscript><style>.JsOnly, .jsOnly { display: none !important; }</style></noscript>
	<link rel="stylesheet" href="css.php?css=xenforo,form,public&amp;style={xen:urlencode $_styleId}&amp;dir={$visitorLanguage.text_direction}&amp;d={$visitorStyle.last_modified_date}" />
	<!--XenForo_Require:CSS-->	
	<xen:if is="@fa_hostlocal">
		<link rel="stylesheet" href="{$requestPaths.fullBasePath}@fa_localpath">
	<xen:else />
		@fa_cdnpath
	</xen:if>
	<xen:if is="@fa_webfonts">
		@fa_googlefont
	</xen:if>

	{xen:helper ignoredCss, {$visitor.ignoredUsers}}

	<xen:include template="google_analytics" />
	<xen:include template="page_container_js_head" />
	
	<link rel="apple-touch-icon" href="{xen:helper fullurl, @ogLogoPath, 1}" />
	<link rel="alternate" type="application/rss+xml" title="{xen:phrase rss_feed_for_x, 'title={$xenOptions.boardTitle}'}" href="{xen:link forums/-/index.rss}" />
	<xen:if is="{$pageDescription.content} AND !{$pageDescription.skipmeta} AND !{$head.description}"><meta name="description" content="{xen:string wordTrim, {xen:helper stripHtml, {xen:raw $pageDescription.content}}, 200}" /></xen:if>
	<xen:if is="{$head}"><xen:foreach loop="$head" value="$headElement">{xen:raw $headElement}</xen:foreach></xen:if>
</xen:hook>
</head>

<body{xen:if {$bodyClasses}, ' class="{$bodyClasses}"'}>
<xen:hook name="body">

<xen:if is="{$visitor.is_moderator} || {$visitor.is_admin}">
	<xen:include template="moderator_bar" />
<xen:elseif is="!{$visitor.user_id} && !{$hideLoginBar}" />
	<xen:include template="login_bar" />
</xen:if>
<div class="topHelper"></div>
<div id="headerMover">
	<div id="headerProxy"></div>

<div id="content" class="{$contentTemplate}">
	<div class="pageWidth">
		<div class="pageContent">
			<!-- main content area -->
			
			<xen:hook name="page_container_content_top" />
			
			<xen:if is="{$sidebar}">
				<div class="mainContainer">
					<div class="mainContent"></xen:if>
						
						<xen:include template="ad_above_top_breadcrumb" />
						
						<xen:hook name="page_container_breadcrumb_top">
						<div class="breadBoxTop {xen:if $topctrl, withTopCtrl}">
							<xen:if is="{$topctrl}"><div class="topCtrl">{xen:raw $topctrl}</div></xen:if>
							<xen:include template="breadcrumb"><xen:set var="$microdata">1</xen:set></xen:include>
						</div>
						</xen:hook>
						
						<xen:include template="ad_below_top_breadcrumb" />
					
						<!--[if lt IE 8]>
							<p class="importantMessage">{xen:phrase you_are_using_out_of_date_browser_upgrade}</p>
						<![endif]-->

						<xen:hook name="page_container_notices">
						<xen:include template="notices" />						
						</xen:hook>
						
						<xen:hook name="page_container_content_title_bar">
						<xen:if is="!{$noH1}">						
							<!-- h1 title, description -->
							<div class="titleBar">
								{xen:raw $beforeH1}
								<h1><xen:if
									is="{$h1}">{xen:raw $h1}<xen:elseif
									is="{$title}" />{xen:raw $title}<xen:else
									/>{$xenOptions.boardTitle}</xen:if></h1>
								
								<xen:if is="{$pageDescription.content}"><p id="pageDescription" class="muted {$pageDescription.class}">{xen:raw $pageDescription.content}</p></xen:if>
							</div>
						</xen:if>
						</xen:hook>
						
						<xen:include template="ad_above_content" />
						
						<!-- main template -->
						{xen:raw $contents}
						
						<xen:include template="ad_below_content" />
						
						<xen:if is="!{$visitor.user_id} && !{$hideLoginBar}">
							<!-- login form, to be moved to the upper drop-down -->
							<xen:include template="login_bar_form" />
						</xen:if>
						
					<xen:if is="{$sidebar}"></div>
				</div>
				
				<!-- sidebar -->
				<aside>
					<div class="sidebar">
						<xen:hook name="page_container_sidebar">
						<xen:include template="ad_sidebar_top" />
						<xen:if is="!{$noVisitorPanel}"><xen:include template="sidebar_visitor_panel" /></xen:if>
						{xen:raw $sidebar}
						<xen:include template="ad_sidebar_bottom" />
						</xen:hook>
					</div>
				</aside>
			</xen:if>
			
			<xen:hook name="page_container_breadcrumb_bottom">			
			<div class="breadBoxBottom"><xen:include template="breadcrumb" /></div>
			</xen:hook>
						
			<xen:include template="ad_below_bottom_breadcrumb" />
						
		</div>
	</div>
</div>

<header>
	<xen:include template="header" />
	<xen:edithint template="navigation" />
	<xen:edithint template="search_bar" />
</header>

</div>

<footer>
	<xen:include template="footer" />
</footer>

<xen:include template="page_container_js_body" />

<xen:if is="{$isIndexPage} AND {$canSearch}">
<script type="application/ld+json">
{
	"@context": "http://schema.org",
	"@type": "WebSite",
	"url": "{xen:jsescape {xen:link canonical:index}}",
	"potentialAction": {
		"@type": "SearchAction",
		"target": "{xen:jsescape {xen:link canonical:search/search}}{xen:if $xenOptions.useFriendlyUrls, '?', '&'}keywords={search_keywords}",
		"query-input": "required name=search_keywords"
	}
}
</script>
</xen:if>

</xen:hook>
<!-- Flat Awesome Version: @fa_version -->
<script type="text/javascript">
	$(function()
	{
		var $button = $('#pageLogin input.button.primary');
		$('#pageLogin input[name="register"]').click(function()
		{
			$button.val(
				$('#pageLogin input[name="register"]:checked').val() == '1'
				? $button.data('signupphrase')
				: $button.data('loginphrase')
			);
		});
	});
</script>
<script type="text/javascript"><xen:comment>/* Chrome bug and for Google cache */</xen:comment>
			var _b = document.getElementsByTagName('base')[0], _bH = "{xen:jsescape $requestPaths.fullBasePath}";
			if (_b && _b.href != _bH) _b.href = _bH;
		</script>
</body>
</html>
