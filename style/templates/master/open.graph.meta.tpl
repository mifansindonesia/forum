<!-- <xen:if is="{$xenOptions.facebookAppId} OR {$xenOptions.facebookAdmins}">
	<meta property="og:site_name" content="{$xenOptions.boardTitle}" />
	<xen:if is="{$avatar}"><meta property="og:image" content="{$avatar}" /></xen:if>
	<meta property="og:image" content="{xen:helper fullurl, @ogLogoPath, 1}" />
	<meta property="og:type" content="{xen:if $ogType, $ogType, article}" />
	<meta property="og:url" content="{xen:raw $url}" />
	<meta property="og:title" content="{xen:raw $title}" />
	<xen:if is="{$description}"><meta property="og:description" content="{xen:raw $description}" /></xen:if>
	{xen:raw $ogExtraHtml}
	<xen:if is="{$xenOptions.facebookAppId}"><meta property="fb:app_id" content="{$xenOptions.facebookAppId}" /></xen:if>
	<xen:if is="{$xenOptions.facebookAdmins}"><meta property="fb:admins" content="{xen:helper implode, {$xenOptions.facebookAdmins}, ','}" /></xen:if>
</xen:if>
-->
<!-- some add -->
<link rel="author" href="https://google.com/+mifansindonesia"/>
<link rel="publisher" href="https://plus.google.com/+mifansindonesia"/>
<!-- https://dev.twitter.com/cards/overview -->
<meta name="twitter:card" content="summary" />
<meta name="twitter:site" content="@mifansindonesia" />
<meta name="twitter:creator" content="@inisi_m" />
<meta name="twitter:creator:id" content="732613421108076544" />
<meta name="twitter:title" content="{xen:raw $title}" />
<xen:if is="{$description}"><meta name="twitter:description" content="{xen:raw $description}" /></xen:if>
<xen:if is="{$avatar}"><meta name="twitter:image" content="{$avatar}" /></xen:if>
<meta property="twitter:image:alt" content="{xen:helper fullurl, @ogLogoPath, 1}" />
<meta property="twitter:url" content="{xen:raw $url}" />
<!-- https://cards-dev.twitter.com/validator -->
<!-- http://ogp.me/ -->
<meta property="og:title" content="{xen:raw $title}" />
<meta property="og:site_name" content="{$xenOptions.boardTitle}"/>
<xen:if is="{$avatar}"><meta property="og:image:url" content="{$avatar}" /></xen:if>
<meta property="og:image" content="{xen:helper fullurl, @ogLogoPath, 1}" />
<xen:if is="{$description}"><meta property="og:description" content="{xen:raw $description}"/></xen:if>
<meta property="og:type" content="website" />
<meta property="og:url" content="{xen:raw $url}" />
<!-- https://developers.facebook.com/tools/debug/ -->
