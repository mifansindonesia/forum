<xen:edithint template="breadcrumb.css" />

<nav>
	<xen:if is="!{$quickNavSelected} AND {$navigation}">
		<xen:foreach loop="$navigation" value="$breadcrumb">
			<xen:if is="{$breadcrumb.node_id}">
				<xen:set var="$quickNavSelected">node-{$breadcrumb.node_id}</xen:set>
			</xen:if>
		</xen:foreach>
	</xen:if>

	<fieldset class="breadcrumb">
		<a href="{xen:link misc/quick-navigation-menu, '', 'selected={$quickNavSelected}'}" class="OverlayTrigger jumpMenuTrigger Tooltip" data-cacheOverlay="true" title="{xen:phrase open_quick_navigation}"><i class="fa fa-sliders faa-flash animated-hover"></i></a>
			
		<div class="boardTitle"><strong>{$xenOptions.boardTitle}</strong></div>
		
		<span class="crumbs">
			<xen:if is="{$showHomeLink}">
				<span class="crust homeCrumb"{xen:if $microdata, ' itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb"'}>
					<a href="{$homeLink}" class="crumb"{xen:if $microdata, ' rel="up" itemprop="url"'}><span{xen:if $microdata, ' itemprop="title"'}><i class="fa fa-home faa-flash animated-hover"></i></span></a>
					<span class="arrow"><span></span></span>
				</span>
			<xen:elseif is="{$selectedTabId} != {$homeTabId}" />
				<span class="crust homeCrumb"{xen:if $microdata, ' itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb"'}>
					<a href="{$homeTab.href}" class="crumb"{xen:if $microdata, ' rel="up" itemprop="url"'}><span{xen:if $microdata, ' itemprop="title"'}><i class="fa fa-home faa-shake animated-hover"></i></span></a>
					<span class="arrow"><span></span></span>
				</span>
			</xen:if>
			
			<xen:if is="{$selectedTab}">
				<span class="crust selectedTabCrumb"{xen:if $microdata, ' itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb"'}>
					<a href="{$selectedTab.href}" class="crumb"{xen:if $microdata, ' rel="up" itemprop="url"'}><span{xen:if $microdata, ' itemprop="title"'}>{$selectedTab.title}</span></a>
					<span class="arrow"><span>&gt;</span></span>
				</span>
			</xen:if>
			
			<xen:if is="{$navigation}">
				<xen:foreach loop="$navigation" value="$breadcrumb" i="$i" count="$count">
					<span class="crust"{xen:if $microdata, ' itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb"'}>
						<a href="{xen:raw $breadcrumb.href}" class="crumb"{xen:if $microdata, ' rel="up" itemprop="url"'}><span{xen:if $microdata, ' itemprop="title"'}>{xen:raw $breadcrumb.value}</span></a>
						<span class="arrow"><span>&gt;</span></span>
					</span>
				</xen:foreach>
			</xen:if>
		</span>
	</fieldset>
</nav>
