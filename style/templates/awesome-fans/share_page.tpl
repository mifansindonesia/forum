<xen:if hascontent="true">
	<xen:require css="share_page.css" />

	<div class="sharePage">
		<h3 class="textHeading larger">{xen:phrase share_this_page}</h3>
		<xen:contentcheck>
			<xen:hook name="share_page_options">
			<xen:if is="{$xenOptions.tweet.enabled}">
				<div class="tweet shareControl">
					<a href="https://twitter.com/share" class="twitter-share-button"
						data-count="horizontal"
						data-lang="{xen:helper twitterLang, $visitorLanguage.language_code}"
						data-url="{$url}"
						{xen:if {$thread.title}, 'data-text="{xen:helper threadPrefix, $thread, escaped}{$thread.title}"'}
						{xen:if {$xenOptions.tweet.via}, 'data-via="{$xenOptions.tweet.via}"'}
						{xen:if {$xenOptions.tweet.related}, 'data-related="{$xenOptions.tweet.related}"'}>{xen:phrase tweet}</a>
				</div>
			</xen:if>
			<xen:if is="{$xenOptions.plusone}">
				<div class="plusone shareControl">
				<!--	<div class="g-plusone" data-size="medium" data-count="true" data-href="{$url}"></div> -->
				
				<!-- AddToAny BEGIN -->
<div class="a2a_kit a2a_kit_size_32 a2a_default_style" data-a2a-icon-color="#2f2f2f">
<a href="https://www.addtoany.com/share"></a>
<a class="a2a_button_twitter faa-wrench animated-hover"></a>
<a class="a2a_button_facebook faa-wrench animated-hover"></a>
<a class="a2a_button_google_plus faa-wrench animated-hover"></a>
<a class="a2a_button_pinterest faa-wrench animated-hover"></a>
<a class="a2a_button_tumblr faa-wrench animated-hover"></a>
<a class="a2a_button_linkedin faa-wrench animated-hover"></a>
<a class="a2a_button_whatsapp faa-wrench animated-hover"></a>
<a class="a2a_button_kakao faa-wrench animated-hover"></a>
<a class="a2a_button_line faa-wrench animated-hover"></a>
<a class="a2a_button_email faa-wrench animated-hover"></a>
<a class="a2a_button_sms faa-wrench animated-hover"></a>
<a class="a2a_button_print faa-wrench animated-hover"></a>
</div>
<!-- AddToAny END -->
				</div>
			</xen:if>
			<xen:if is="{$xenOptions.facebookLike}">
				<div class="facebookLike shareControl">
					<xen:container var="$facebookSdk">1</xen:container>
					<div class="fb-like" data-href="{$url}" data-width="400" data-layout="standard" data-action="{$xenOptions.facebookLikeAction}" data-show-faces="true" data-colorscheme="@fbColorScheme"></div>
				</div>
			</xen:if>
			</xen:hook>
		</xen:contentcheck>
	</div>
</xen:if>
