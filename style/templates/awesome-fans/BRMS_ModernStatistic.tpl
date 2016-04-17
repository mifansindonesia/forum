<xen:if is="{$modernStatistic.tab_data} && {$modernStatistic.active}">
	<xen:if hascontent="true">
	<div<xen:comment>
		</xen:comment> class="BRMSContainer {$modernStatistic.displayStyle} {xen:if {$modernStatistic.control_position},'{$modernStatistic.control_position}','brmsLeftTabs'}"
		data-loadUrl="{xen:link 'full:brms-statistic/statistics.json'}"
		data-previewType="{$modernStatistic.preview_tooltip}"
		data-allowCusItemLimit="{xen:if '{$modernStatistic.itemLimit.enabled} && !{$modernStatistic.enable_cache}',1,0}"
		data-allowCusLayout="{xen:if {$modernStatistic.allow_change_layout},1,0}"
		data-modernStatisticId="{xen:if {$modernStatistic.modern_statistic_id},'{$modernStatistic.modern_statistic_id}',0}"
		data-navPosition="{xen:if {$modernStatistic.control_position},'{$modernStatistic.control_position}','brmsLeftTabs'}"
		data-useLimit="{xen:if '{$cachedStatistic.item_limit} && !{$modernStatistic.enable_cache}','{$cachedStatistic.item_limit}',''}"
		data-updateInterval="{xen:if '{$modernStatistic.auto_update} && !{$modernStatistic.enable_cache}','{$modernStatistic.auto_update}',0}" <xen:comment>
	</xen:comment>>
		<div class="brmsStatisticHeader">
			<div class="brmsConfigList">
				<xen:if is="{$modernStatistic.itemLimit.enabled} && !{$modernStatistic.enable_cache}">
				<div class="brmsConfigBtn brmsDropdownToggle brmsLimitList">
					<a href="javascript:;" class="brmsIco brmsIcoConfig"></a>
					<ul class="brmsDropdownMenu">
						<xen:if is="{$modernStatistic.itemLimit.value}">
							<xen:foreach loop="$modernStatistic.itemLimit.value" key="$key" value="$numberLimit">
								<li {xen:if '{$key}==0','class="first"'}><a href="#" class="brmsNumberEntry" data-limit="{$numberLimit}">{$numberLimit} {xen:phrase BRMS_entries}</a></li>
							</xen:foreach>
						</xen:if>
					</ul>
				</div>
				</xen:if>
				<xen:if is="{$modernStatistic.allow_manual_refresh}">
				<div class="brmsConfigBtn brmsRefresh"><a href="javascript:;" class="brmsIco brmsIcoRefresh"></a></div>
				</xen:if>
				<xen:if is="{$modernStatistic.allow_change_layout}">
				<div class="brmsConfigBtn brmsDropdownToggle brmsLayoutList last">
					<a href="javascript:;" class="brmsIco brmsIcoLayout"></a>
					<ul class="brmsDropdownMenu">
						
						<li class="first"><a href="#" class="brmsLayoutChange" data-layout="brmsTopTabs">{xen:phrase top}</a></li>
						<li><a href="#" class="brmsLayoutChange" data-layout="brmsLeftTabs">{xen:phrase left}</a></li>
						<li><a href="#" class="brmsLayoutChange" data-layout="brmsRightTabs">{xen:phrase right}</a></li>
						
					</ul>
				</div>
				</xen:if>
			</div>
			<ul class="brmsTabNav">
				<xen:contentcheck>
				<xen:foreach loop="$modernStatistic.tabData" key="$key" value="$tab">
					<xen:if is="{$tab.active} && ({$tab.type}!='my_threads'||{$visitor.user_id})">
						<li class="brmlShow"><a class="brmsTabHandler_{$key}" href="javascript:;" data-content="brmsTabContent_{$key}" data-tabid="{$key}"><span>{xen:if '{$tab.defaultTitle}','{xen:raw $tab.defaultTitle}','{xen:raw $tab.title}'}</span></a></li>
					</xen:if>
				</xen:foreach>
				</xen:contentcheck>
				<li class="brmsTabNavHiddenMenu last">
					<div class="brmsTabNavHidden brmsDropdownToggle">
						<a href="javascript:;" class="brmsIco brmsIcoList"></a>
						<ul class="brmsDropdownMenu">
							<xen:foreach loop="$modernStatistic.tabData" key="$key" value="$tab">
								<xen:if is="{$tab.active} && ({$tab.type}!='my_threads'||{$visitor.user_id})">
									<li class="brmlShow"><a class="brmsTabHandler_{$key}" href="javascript:;" data-content="brmsTabContent_{$key}" data-tabid="{$key}"><span>{xen:if '{$tab.defaultTitle}','{xen:raw $tab.defaultTitle}','{xen:raw $tab.title}'}</span></a></li>
								</xen:if>
							</xen:foreach>
						</ul>
					</div>
				</li>
			</ul>
		</div>
		<xen:foreach loop="$modernStatistic.tabData" key="$key" value="$tab">
			<xen:if is="{$tab.active} && ({$tab.type}!='my_threads'||{$visitor.user_id})">
			<div class="brmsTabContent brmsTabContent_{$key}" data-content="brmsTabContent_{$key}">
				<xen:if is="{$key}==0">
					<xen:if is="{$firstTabHtml}">{xen:raw $firstTabHtml}<xen:else /><div class="brmsIcoLoader brmsIcoRefresh"></div><div class="clear"></div></xen:if>
				<xen:else />
					<div class="brmsIcoLoader brmsIcoRefresh"></div><div class="clear"></div>
				</xen:if>
			</div>
			</xen:if>
		</xen:foreach>
		<div class="xenTooltip brmsToolTip"></div>
	</div>
	<div style="clear:both;"></div>
	<xen:include template="preview_tooltip" />
	</xen:if>
</xen:if>
<xen:edithint template="BRMS_ModernStatistic.css" />
