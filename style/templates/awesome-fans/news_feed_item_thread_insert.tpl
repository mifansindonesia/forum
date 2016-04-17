<p class="description">{xen:phrase news_feed_thread_insert,
	'username={xen:helper username, $user, 'primaryText'}'
}</p>

<h3 class="title thread"><i class="fa fa-bullhorn"></i> <a href="{xen:link threads, $content}">{xen:helper threadPrefix, $content}{$content.title}</a></h3>

<p class="snippet post">{xen:helper snippet, $content.message, $xenOptions.newsFeedMessageSnippetLength}</p>

<xen:include template="news_feed_attached_images" />

<h4 class="minorTitle forum"><i class="fa fa-bars"></i> {xen:phrase forum}: <a href="{xen:link forums, $content}">{$content.node_title}</a></h4>
