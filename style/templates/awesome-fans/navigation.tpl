<xen:edithint template="navigation.css" />

<div id="navigation" class="pageWidth {xen:if $canSearch, withSearch}">
	<div class="pageContent">
		<nav>

<div class="navTabs">
	<ul class="publicTabs">
	
		<!-- home 

		<xen:if is="{$showHomeLink}">
			<li class="navTab home PopupClosed"><a href="{$homeLink}" class="navLink">{xen:phrase home}</a></li>
		</xen:if>
		-->
		
		<!-- extra tabs: home -->
		<xen:if is="{$extraTabs.home}">
		<xen:foreach loop="$extraTabs.home" key="$extraTabId" value="$extraTab">
			<xen:if is="{$extraTab.linksTemplate}">
				<li class="navTab {$extraTabId} {xen:if $extraTab.selected, 'selected', 'Popup PopupControl PopupClosed'}">
			
				<a href="{$extraTab.href}" class="navLink">{$extraTab.title}<xen:if is="{$extraTab.counter}"><strong class="itemCount"><span class="Total">{$extraTab.counter}</span><span class="arrow"></span></strong></xen:if></a>
				<a href="{$extraTab.href}" class="SplitCtrl" rel="Menu">@fa_navarrow</a>
				
				<div class="{xen:if {$extraTab.selected}, 'tabLinks', 'Menu JsOnly tabMenu'} {$extraTabId}TabLinks">
					<div class="primaryContent menuHeader">
						<h3>{$extraTab.title}</h3>
						<div class="muted">{xen:phrase quick_links}</div>
					</div>
					{xen:raw $extraTab.linksTemplate}
				</div>
			</li>
			<xen:else />
				<li class="navTab {$extraTabId} {xen:if $extraTab.selected, 'selected', 'PopupClosed'}">
					<a href="{$extraTab.href}" class="navLink">{$extraTab.title}<xen:if is="{$extraTab.counter}"><strong class="itemCount"><span class="Total">{$extraTab.counter}</span><span class="arrow"></span></strong></xen:if></a>

					<xen:if is="{$extraTab.selected}"><div class="tabLinks"></div></xen:if>
				</li>
			</xen:if>
		</xen:foreach>
		</xen:if>
		
		
		<!-- forums -->
		<xen:if is="{$tabs.forums}">
			<li class="navTab forums {xen:if $tabs.forums.selected, 'selected', 'Popup PopupControl PopupClosed'}">
			
				<a href="{$tabs.forums.href}" class="navLink">{$tabs.forums.title}</a>
				<a href="{$tabs.forums.href}" class="SplitCtrl" rel="Menu">@fa_navarrow</a>
				
				<div class="{xen:if {$tabs.forums.selected}, 'tabLinks', 'Menu JsOnly tabMenu'} forumsTabLinks">
					<div class="primaryContent menuHeader">
						<h3>{$tabs.forums.title}</h3>
						<div class="muted">{xen:phrase quick_links}</div>
					</div>
					<ul class="secondaryContent blockLinksList">
					<xen:hook name="navigation_tabs_forums">
						<xen:if is="{$visitor.user_id}"><li><a href="{xen:link 'forums/-/mark-read', $forum, 'date={$serverTime}'}" class="OverlayTrigger">{xen:phrase mark_forums_read}</a></li></xen:if>
						<xen:if is="{$canSearch}"><li><a href="{xen:link search, '', 'type=post'}">{xen:phrase search_forums}</a></li></xen:if>
						<xen:if is="{$visitor.user_id}">
							<li><a href="{xen:link 'watched/forums'}">{xen:phrase watched_forums}</a></li>
							<li><a href="{xen:link 'watched/threads'}">{xen:phrase watched_threads}</a></li>
						</xen:if>
						<li><a href="{xen:link 'find-new/posts'}" rel="nofollow">{xen:if $visitor.user_id, {xen:phrase new_posts}, {xen:phrase recent_posts}}</a></li>
					</xen:hook>
					</ul>
				</div>
			</li>
		</xen:if>
		
		
		<!-- extra tabs: middle -->
		<xen:if is="{$extraTabs.middle}">
		<xen:foreach loop="$extraTabs.middle" key="$extraTabId" value="$extraTab">
			<xen:if is="{$extraTab.linksTemplate}">
				<li class="navTab {$extraTabId} {xen:if $extraTab.selected, 'selected', 'Popup PopupControl PopupClosed'}">
			
				<a href="{$extraTab.href}" class="navLink">{$extraTab.title}<xen:if is="{$extraTab.counter}"><strong class="itemCount"><span class="Total">{$extraTab.counter}</span><span class="arrow"></span></strong></xen:if></a>
				<a href="{$extraTab.href}" class="SplitCtrl" rel="Menu">@fa_navarrow</a>
				
				<div class="{xen:if {$extraTab.selected}, 'tabLinks', 'Menu JsOnly tabMenu'} {$extraTabId}TabLinks">
					<div class="primaryContent menuHeader">
						<h3>{$extraTab.title}</h3>
						<div class="muted">{xen:phrase quick_links}</div>
					</div>
					{xen:raw $extraTab.linksTemplate}
				</div>
			</li>
			<xen:else />
				<li class="navTab {$extraTabId} {xen:if $extraTab.selected, 'selected', 'PopupClosed'}">
					<a href="{$extraTab.href}" class="navLink">{$extraTab.title}<xen:if is="{$extraTab.counter}"><strong class="itemCount"><span class="Total">{$extraTab.counter}</span><span class="arrow"></span></strong></xen:if></a>

					<xen:if is="{$extraTab.selected}"><div class="tabLinks"></div></xen:if>
				</li>
			</xen:if>
		</xen:foreach>
		</xen:if>
		
		
		<!-- members -->
		<xen:if is="{$tabs.members}">
			<li class="navTab members {xen:if $tabs.members.selected, 'selected', 'Popup PopupControl PopupClosed'}">
			
				<a href="{$tabs.members.href}" class="navLink">{$tabs.members.title}</a>
				<a href="{$tabs.members.href}" class="SplitCtrl" rel="Menu">@fa_navarrow</a>
				
				<div class="{xen:if {$tabs.members.selected}, 'tabLinks', 'Menu JsOnly tabMenu'} membersTabLinks">
					<div class="primaryContent menuHeader">
						<h3>{$tabs.members.title}</h3>
						<div class="muted">{xen:phrase quick_links}</div>
					</div>
					<ul class="secondaryContent blockLinksList">
					<xen:hook name="navigation_tabs_members">
						<li><a href="{xen:link members}">{xen:phrase notable_members}</a></li>
						<xen:if is="{$xenOptions.enableMemberList}"><li><a href="{xen:link members/list}">{xen:phrase registered_members}</a></li></xen:if>
						<li><a href="{xen:link online}">{xen:phrase current_visitors}</a></li>
						<xen:if is="{$xenOptions.enableNewsFeed}"><li><a href="{xen:link recent-activity}">{xen:phrase recent_activity}</a></li></xen:if>
						<xen:if is="{$canViewProfilePosts}"><li><a href="{xen:link find-new/profile-posts}">{xen:phrase new_profile_posts}</a></li></xen:if>
					</xen:hook>
					</ul>
				</div>
			</li>
		</xen:if>				
		
		<!-- extra tabs: end -->
		<xen:if is="{$extraTabs.end}">
		<xen:foreach loop="$extraTabs.end" key="$extraTabId" value="$extraTab">
			<xen:if is="{$extraTab.linksTemplate}">
				<li class="navTab {$extraTabId} {xen:if $extraTab.selected, 'selected', 'Popup PopupControl PopupClosed'}">
			
				<a href="{$extraTab.href}" class="navLink">{$extraTab.title}<xen:if is="{$extraTab.counter}"><strong class="itemCount"><span class="Total">{$extraTab.counter}</span><span class="arrow"></span></strong></xen:if></a>
				<a href="{$extraTab.href}" class="SplitCtrl" rel="Menu">@fa_navarrow</a>
				
				<div class="{xen:if {$extraTab.selected}, 'tabLinks', 'Menu JsOnly tabMenu'} {$extraTabId}TabLinks">
					<div class="primaryContent menuHeader">
						<h3>{$extraTab.title}</h3>
						<div class="muted">{xen:phrase quick_links}</div>
					</div>
					{xen:raw $extraTab.linksTemplate}
				</div>
			</li>
			<xen:else />
				<li class="navTab {$extraTabId} {xen:if $extraTab.selected, 'selected', 'PopupClosed'}">
					<a href="{$extraTab.href}" class="navLink">{$extraTab.title}<xen:if is="{$extraTab.counter}"><strong class="itemCount"><span class="Total">{$extraTab.counter}</span><span class="arrow"></span></strong></xen:if></a>

					<xen:if is="{$extraTab.selected}"><div class="tabLinks"></div></xen:if>
				</li>
			</xen:if>
		</xen:foreach>
		</xen:if>

		<!-- responsive popup -->
		<li class="navTab navigationHiddenTabs Popup PopupControl PopupClosed" style="display:none">	
						
			<a rel="Menu" class="navLink NoPopupGadget"><span class="menuIcon">{xen:phrase menu}</span></a>
			
			<div class="Menu JsOnly blockLinksList primaryContent" id="NavigationHiddenMenu"></div>
		</li>
			
		
		<!-- no selection -->
		<xen:if is="!{$selectedTab}">
			<li class="navTab selected"><div class="tabLinks"></div></li>
		</xen:if>
		
	</ul>
	
	<xen:if is="{$visitor.user_id}"><xen:include template="navigation_visitor_tab" /></xen:if>
</div>

<span class="helper"></span>
			
		</nav>	
	</div>
</div>
