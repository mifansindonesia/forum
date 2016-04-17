<xen:if is="{$visitor.user_id}">

<div class="section visitorPanel">
	<div class="secondaryContent">
	
		<xen:avatar user="$visitor" size="m" img="true" />
		
		<div class="visitorText">
			<h2>{xen:phrase signed_in_as_x_sidebar, 'name={xen:helper username, $visitor, 'NoOverlay'}'}</h2>		
			<div class="stats">
			<xen:hook name="sidebar_visitor_panel_stats">
				<dl class="pairsJustified"><dt>{xen:phrase messages}:</dt> <dd>{xen:number $visitor.message_count}</dd></dl>
				<dl class="pairsJustified"><dt>{xen:phrase likes}:</dt> <dd>{xen:number $visitor.like_count}</dd></dl>
				<xen:if is="{$xenOptions.enableTrophies}">
					<dl class="pairsJustified"><dt>{xen:phrase points}:</dt> <dd>{xen:number $visitor.trophy_points}</dd></dl>
				</xen:if>
			</div>
			</xen:hook>
		</div>
		
	</div>
</div>

<xen:else />
<!--
<div class="section loginButton">		
	<div class="secondaryContent">
		<label for="LoginControl" id="SignupButton"><a href="{xen:link login}" class="inner">{xen:if $xenOptions.registrationSetup.enabled, {xen:phrase sign_up_now}, {xen:phrase log_in}}</a></label>
	</div>
</div>
-->
</xen:if>

<xen:include template="ad_sidebar_below_visitor_panel" />
