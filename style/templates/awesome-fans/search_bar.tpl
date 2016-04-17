<xen:edithint template="search_bar.css" />

<div id="searchBar" class="pageWidth">
	<xen:hook name="quick_search">
	<span id="QuickSearchPlaceholder" title="{xen:phrase search}"><i class="fa fa-search"></i></span>
	<fieldset id="QuickSearch">
		<form action="{xen:link 'search/search'}" method="post" class="formPopup">
			
			<div class="primaryControls">
				<!-- block: primaryControls -->
				<input type="search" name="keywords" value="" class="textCtrl" placeholder="{xen:phrase search}..." title="{xen:phrase enter_your_search_and_hit_enter}" id="QuickSearchQuery" />				
				<!-- end block: primaryControls -->
			</div>
			
			<div class="secondaryControls">
				<div class="controlsWrapper">
				
					<!-- block: secondaryControls -->
					<dl class="ctrlUnit">
						<dt></dt>
						<dd><ul>
							<li><label><input type="checkbox" name="title_only" value="1"
								id="search_bar_title_only" class="AutoChecker"
								data-uncheck="#search_bar_thread" /> {xen:phrase search_titles_only}</label></li>
						</ul></dd>
					</dl>
				
					<dl class="ctrlUnit">
						<dt><label for="searchBar_users">{xen:phrase posted_by_member}:</label></dt>
						<dd>
							<input type="text" name="users" value="" class="textCtrl AutoComplete" id="searchBar_users" />
							<p class="explain">{xen:phrase separate_names_with_comma}</p>
						</dd>
					</dl>
				
					<dl class="ctrlUnit">
						<dt><label for="searchBar_date">{xen:phrase newer_than}:</label></dt>
						<dd><input type="date" name="date" value="" class="textCtrl" id="searchBar_date" /></dd>
					</dl>
					
					<xen:if is="{$searchBar}">
					<dl class="ctrlUnit">
						<dt></dt>
						<dd><ul>
								<xen:foreach loop="$searchBar" value="{$constraint}">
									<li>{xen:raw $constraint}</li>
								</xen:foreach>
						</ul></dd>
					</dl>
					</xen:if>
				</div>
				<!-- end block: secondaryControls -->
				
				<dl class="ctrlUnit submitUnit">
					<dt></dt>
					<dd>
						<input type="submit" value="{xen:phrase search}" class="button primary Tooltip" title="{xen:phrase find_now}" />
						<div class="Popup" id="commonSearches">
							<a rel="Menu" class="button NoPopupGadget Tooltip" title="{xen:phrase useful_searches}" data-tipclass="flipped"><span class="arrowWidget"></span></a>
							<div class="Menu">
								<div class="primaryContent menuHeader">
									<h3>{xen:phrase useful_searches}</h3>
								</div>
								<ul class="secondaryContent blockLinksList">
									<!-- block: useful_searches -->
									<li><a href="{xen:link find-new/posts, '', 'recent=1'}" rel="nofollow">{xen:phrase recent_posts}</a></li>
									<xen:if is="{$visitor.user_id}">
									<li><a href="{xen:link search/member, '', 'user_id={$visitor.user_id}', 'content=thread'}">{xen:phrase your_threads}</a></li>
									<li><a href="{xen:link search/member, '', 'user_id={$visitor.user_id}', 'content=post'}">{xen:phrase your_posts}</a></li>
									<li><a href="{xen:link search/member, '', 'user_id={$visitor.user_id}', 'content=profile_post'}">{xen:phrase your_profile_posts}</a></li>
									</xen:if>
									<!-- end block: useful_searches -->
								</ul>
							</div>
						</div>
						<a href="{xen:link search}" class="button moreOptions Tooltip" title="{xen:phrase advanced_search}">{xen:phrase more}...</a>
					</dd>
				</dl>
				
			</div>
			
			<input type="hidden" name="_xfToken" value="{$visitor.csrf_token_page}" />
		</form>		
	</fieldset>
	</xen:hook>
</div>
