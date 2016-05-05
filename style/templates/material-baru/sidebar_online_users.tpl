<xen:edithint template="sidebar.css" />

<!-- block: sidebar_online_staff -->
<xen:if hascontent="true">
	<div class="section staffOnline avatarList">
		<div class="secondaryContent">
			<h3><a href="{xen:link members, '', 'type=staff'}">{xen:phrase staff_online_now}</a></h3>
			<ul>
				<xen:contentcheck>
					<xen:foreach loop="$onlineUsers.records" value="$user">
						<xen:if is="{$user.is_staff}">
							<li>
								<xen:avatar user="$user" size="s" img="true" />
								<xen:username user="$user" rich="true" />
								<div class="userTitle">{xen:helper userTitle, $user}</div>
							</li>
						</xen:if>
					</xen:foreach>
				</xen:contentcheck>
			</ul>
		</div>
	</div>
</xen:if>
<!-- end block: sidebar_online_staff -->

<!-- block: sidebar_online_users -->
<div class="section membersOnline userList">		
	<div class="secondaryContent">
		<h3><a href="{xen:link online}" title="{xen:phrase see_all_online_users}">{xen:phrase members_online_now}</a></h3>
		
		<xen:if is="{$onlineUsers.records}">
		
			<xen:if is="{$visitor.user_id}">
				<xen:if hascontent="true">
				<h4 class="minorHeading"><a href="{xen:link account/following}">{xen:phrase people_you_follow}:</a></h4>
				<ul class="followedOnline">
					<xen:contentcheck>
						<xen:foreach loop="$onlineUsers.records" value="$user">
							<xen:if is="{$user.followed}">
								<li title="{$user.username}" class="Tooltip"><xen:avatar user="$user" size="s" img="true" class="_plainImage" /></li>
							</xen:if>
						</xen:foreach>
					</xen:contentcheck>
				</ul>
				<h4 class="minorHeading"><a href="{xen:link members}">{xen:phrase members}:</a></h4>
				</xen:if>
			</xen:if>
			
			<ol class="listInline">
				<xen:foreach loop="$onlineUsers.records" value="$user" i="$i">
					<xen:if is="{$i} <= {$onlineUsers.limit}">
						<li>
						<xen:if is="{$user.user_id}">
							<a href="{xen:link members, $user}"
								class="username{xen:if '!{$user.visible}', ' invisible'}{xen:if {$user.followed}, ' followed'}">{$user.username}</a><xen:if is="{$i} < {$onlineUsers.limit}">,</xen:if>
						<xen:else />
							{xen:phrase guest}<xen:if is="{$i} < {$onlineUsers.limit}">,</xen:if>
						</xen:if>
						</li>
					</xen:if>
				</xen:foreach>
				<xen:if is="{$onlineUsers.recordsUnseen}">
					<li class="moreLink">... <a href="{xen:link online}" title="{xen:phrase see_all_visitors}">{xen:phrase and_x_more, 'count={xen:number $onlineUsers.recordsUnseen}'}</a></li>
				</xen:if>
			</ol>
		</xen:if>
		
		<div class="footnote">
			{xen:phrase online_now_x_members_y_guests_z_robots_a, 'total={xen:number $onlineUsers.total}', 'members={xen:number $onlineUsers.members}', 'guests={xen:number $onlineUsers.guests}', 'robots={xen:number $onlineUsers.robots}'}
		</div>
	</div>
</div>
<!-- end block: sidebar_online_users -->
