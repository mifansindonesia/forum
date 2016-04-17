<xen:comment>
With Javascript enabled, this form will be moved at page init time,
with the command $('#login').appendTo('#loginBar .pageContent');

Note that all external auth checks need to be added to the conditional below
in order to set $eAuth = 1 if any external auth providers are available.
</xen:comment>

<xen:hook name="login_bar_eauth_set">
<xen:if is="{$xenOptions.facebookAppId}"><xen:set var="$eAuth">1</xen:set></xen:if>
<xen:if is="{$xenOptions.twitterAppKey}"><xen:set var="$eAuth">1</xen:set></xen:if>
<xen:if is="{$xenOptions.googleClientId}"><xen:set var="$eAuth">1</xen:set></xen:if>
</xen:hook>

<form action="{xen:link 'login/login'}" method="post" class="xenForm {xen:if $eAuth, 'eAuth'}" id="login" style="display:none">

	<xen:if hascontent="true">
		<ul id="eAuthUnit">
			<xen:contentcheck>
				<xen:hook name="login_bar_eauth_items">
				<xen:if is="{$xenOptions.facebookAppId}">
					<xen:require css="facebook.css" />
					<li><a href="{xen:link register/facebook, '', 'reg=1'}" class="fbLogin" tabindex="110"><span><i class="fa fa-facebook"></i> {xen:phrase login_with_facebook}</span></a></li>
				</xen:if>
				
				<xen:if is="{$xenOptions.twitterAppKey}">
					<xen:require css="twitter.css" />
					<li><a href="{xen:link register/twitter, '', 'reg=1'}" class="twitterLogin" tabindex="110"><i class="fa fa-twitter"></i><span>{xen:phrase login_with_twitter}</span></a></li>
				</xen:if>
				
				<xen:if is="{$xenOptions.googleClientId}">
					<xen:require css="google.css" />
					<li><span class="googleLogin GoogleLogin JsOnly" tabindex="110" data-client-id="{$xenOptions.googleClientId}" data-redirect-url="{xen:link register/google, '', 'code=__CODE__', 'csrf={$session.sessionCsrf}'}"><i class="fa fa-google-plus"></i><span>{xen:phrase login_with_google}</span></span></li>
				</xen:if>
				</xen:hook>
			</xen:contentcheck>
		</ul>
	</xen:if>

	<div class="ctrlWrapper">
		<dl class="ctrlUnit">
			<dt><label for="LoginControl">{xen:phrase your_name_or_email_address}:</label></dt>
			<dd><input type="text" name="login" id="LoginControl" class="textCtrl" tabindex="101" /></dd>
		</dl>
	
	<xen:if is="{$xenOptions.registrationSetup.enabled}">
		<dl class="ctrlUnit">
			<dt>
				<label for="ctrl_password">{xen:phrase do_you_already_have_account}</label>
			</dt>
			<dd>
				<ul>
					<li><label for="ctrl_not_registered"><input type="radio" name="register" value="1" id="ctrl_not_registered" tabindex="105" />
						{xen:phrase no_create_account_now}</label></li>
					<li><label for="ctrl_registered"><input type="radio" name="register" value="0" id="ctrl_registered" tabindex="105" checked="checked" class="Disabler" />
						{xen:phrase yes_my_password_is}:</label></li>
					<li id="ctrl_registered_Disabler">
						<input type="password" name="password" class="textCtrl" id="ctrl_password" tabindex="102" />
						<div class="lostPassword"><a href="{xen:link lost-password}" class="OverlayTrigger OverlayCloser" tabindex="106">{xen:phrase forgot_your_password}</a></div>
					</li>
				</ul>
			</dd>
		</dl>
	<xen:else />
		<dl class="ctrlUnit">
			<dt>
				<label for="ctrl_password">{xen:phrase password}:</label>
			</dt>
			<dd>
				<input type="password" name="password" class="textCtrl" id="ctrl_password" tabindex="102" />
				<div class="lostPasswordLogin"><a href="{xen:link lost-password}" class="OverlayTrigger OverlayCloser" tabindex="106">{xen:phrase forgot_your_password}</a></div>
			</dd>
		</dl>
	</xen:if>
		
		<dl class="ctrlUnit submitUnit">
			<dt></dt>
			<dd>
				<input type="submit" class="button primary" value="{xen:phrase log_in}" tabindex="104" data-loginPhrase="{xen:phrase log_in}" data-signupPhrase="{xen:phrase sign_up}" />
				<label for="ctrl_remember" class="rememberPassword"><input type="checkbox" name="remember" value="1" id="ctrl_remember" tabindex="103" /> {xen:phrase stay_logged_in}</label>
			</dd>
		</dl>
	</div>

	<input type="hidden" name="cookie_check" value="1" />
	<input type="hidden" name="redirect" value="{$requestPaths.requestUri}" />
	<input type="hidden" name="_xfToken" value="{$visitor.csrf_token_page}" />

</form>
