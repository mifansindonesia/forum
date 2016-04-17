<xen:title>{xen:phrase error}</xen:title>
<xen:h1>{$xenOptions.boardTitle} - {xen:phrase error}</xen:h1>

<xen:container var="$head.robots"><meta name="robots" content="noindex" /></xen:container>

<div class="errorOverlay">
	<a class="close OverlayCloser"></a>
	<xen:if is="{xen:count $error, false} == 1">
		<xen:if is="{$showHeading}"><h2 class="heading">{xen:phrase following_error_occurred}:</h2></xen:if>
		
		<div class="baseHtml">
		<xen:foreach loop="$error" key="$key" value="$value">
			<label for="ctrl_{$key}" class="OverlayCloser">{xen:raw $value}</label>
		</xen:foreach>
		</div>
	<xen:else />
		<xen:if is="{$showHeading}"><h2 class="heading">{xen:phrase please_correct_following_errors}:</h2></xen:if>
	
		<div class="baseHtml">
			<ul>
			<xen:foreach loop="$error" key="$key" value="$value">
				<li><label for="ctrl_{$key}" class="OverlayCloser">{xen:raw $value}</label></li>
			</xen:foreach>
			</ul>
		</div>
	</xen:if>
</div>
