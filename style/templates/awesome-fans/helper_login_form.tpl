<xen:if is="!{$visitor.user_id}">

<xen:container var="$hideLoginBar">1</xen:container>

<form action="{xen:link 'login/login'}" method="post" class="xenForm" id="pageLogin">

	<xen:if hascontent="true">
		<div class="errorPanel"><span class="errors">
			<xen:contentcheck>{xen:raw $text}</xen:contentcheck>
		</span></div>
	</xen:if>
	
	<h2 class="textHeading">{xen:phrase log_in_or_sign_up}</h2>

	<dl class="ctrlUnit">
		<dt><label for="ctrl_pageLogin_login">{xen:phrase your_name_or_email_address}:</label></dt>
		<dd><input type="text" name="login" value="{$defaultLogin}" id="ctrl_pageLogin_login" class="textCtrl" tabindex="1" /></dd>
	</dl>

<xen:if is="{$xenOptions.registrationSetup.enabled}">
	<dl class="ctrlUnit">
		<dt><label for="ctrl_pageLogin_password">{xen:phrase do_you_already_have_account}</label></dt>
		<dd>
			<ul>
				<li><label for="ctrl_pageLogin_not_registered"><input type="radio" name="register" value="1" id="ctrl_pageLogin_not_registered" tabindex="5" />
					{xen:phrase no_create_account_now}</label></li>
				<li><label for="ctrl_pageLogin_registered"><input type="radio" name="register" value="0" id="ctrl_pageLogin_registered" checked="checked" class="Disabler" tabindex="5" />
					{xen:phrase yes_my_password_is}:</label></li>
				<li id="ctrl_pageLogin_registered_Disabler">
					<input type="password" name="password" class="textCtrl" id="ctrl_pageLogin_password" tabindex="2" />					
					<div><a href="{xen:link lost-password}" class="OverlayTrigger OverlayCloser" tabindex="6">{xen:phrase forgot_your_password}</a></div>
				</li>
			</ul>
		</dd>
	</dl>
<xen:else />
	<dl class="ctrlUnit">
		<dt><label for="ctrl_pageLogin_password">{xen:phrase password}:</label></dt>
		<dd>
			<input type="password" name="password" class="textCtrl" id="ctrl_pageLogin_password" tabindex="2" />					
			<div><a href="{xen:link lost-password}" class="OverlayTrigger OverlayCloser" tabindex="6">{xen:phrase forgot_your_password}</a></div>
		</dd>
	</dl>
</xen:if>
	
	<xen:if is="{$captcha}">
		<dl class="ctrlUnit">
			<dt>{xen:phrase verification}:</dt>
			<dd>{xen:raw $captcha}</dd>
		</dl>
	</xen:if>

	<dl class="ctrlUnit submitUnit">
		<dt></dt>
		<dd>
			<input type="submit" class="button primary" value="{xen:phrase log_in}" data-loginPhrase="{xen:phrase log_in}" data-signupPhrase="{xen:phrase sign_up}" tabindex="4" />
			<label class="rememberPassword"><input type="checkbox" name="remember" value="1" id="ctrl_pageLogin_remember" tabindex="3" /> {xen:phrase stay_logged_in}</label>
		</dd>
	</dl>

	<xen:if is="{$xenOptions.facebookAppId}">
		<xen:require css="facebook.css" />
		<dl class="ctrlUnit">
			<dt></dt>
			<dd><a href="{xen:link register/facebook, '', 'reg=1'}" class="fbLogin" tabindex="10"><span><i class="fa fa-facebook"></i>{xen:phrase login_with_facebook}</span></a></dd>
		</dl>
	</xen:if>
	
	<xen:if is="{$xenOptions.twitterAppKey}">
		<xen:require css="twitter.css" />
		<dl class="ctrlUnit">
			<dt></dt>
			<dd><a href="{xen:link register/twitter, '', 'reg=1'}" class="twitterLogin" tabindex="10"><i class="fa fa-twitter"></i> <span>{xen:phrase login_with_twitter}</span></a></dd>
		</dl>
	</xen:if>
	
	<xen:if is="{$xenOptions.googleClientId}">
		<xen:require css="google.css" />
		<dl class="ctrlUnit">
			<dt></dt>
			<dd><span class="googleLogin GoogleLogin JsOnly" tabindex="10" data-client-id="{$xenOptions.googleClientId}" data-redirect-url="{xen:link register/google, '', 'code=__CODE__', 'csrf={$session.sessionCsrf}'}"><i class="fa fa-google-plus"></i> <span>{xen:phrase login_with_google}</span></span></dd>
		</dl>
	</xen:if>
	
	<input type="hidden" name="cookie_check" value="1" />
	<input type="hidden" name="_xfToken" value="{$visitor.csrf_token_page}" />
	<input type="hidden" name="redirect" value="{xen:if $redirect, $redirect, $requestPaths.requestUri}" />
	<xen:if is="{$postData}">
		<input type="hidden" name="postData" value="{xen:escape {xen:helper json, $postData}}" />
	</xen:if>

</form>


</xen:if>
