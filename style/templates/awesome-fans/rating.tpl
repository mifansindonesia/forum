<xen:require css="rating.css" />

<xen:if is="{$action}">
	<xen:require js="js/xenforo/rating.js" />

	<form action="{$action}" method="post" class="rating RatingWidget" {xen:if $microdata, 'itemscope="itemscope" itemtype="http://data-vocabulary.org/Rating"'}>
		<dl>
			<dt class="prompt muted">{xen:raw $prompt}</dt>
			<dd>
				<span class="ratings">
					 <button type="submit" name="rating" value="1" class="star {xen:if '{$rating} >= 1', 'Full'}{xen:if '{$rating} >= 0.5 AND {$rating} < 1', 'Half'}" title="{xen:phrase rating_1}"></button
					><button type="submit" name="rating" value="2" class="star {xen:if '{$rating} >= 2', 'Full'}{xen:if '{$rating} >= 1.5 AND {$rating} < 2', 'Half'}" title="{xen:phrase rating_2}"></button
					><button type="submit" name="rating" value="3" class="star {xen:if '{$rating} >= 3', 'Full'}{xen:if '{$rating} >= 2.5 AND {$rating} < 3', 'Half'}" title="{xen:phrase rating_3}"></button
					><button type="submit" name="rating" value="4" class="star {xen:if '{$rating} >= 4', 'Full'}{xen:if '{$rating} >= 3.5 AND {$rating} < 4', 'Half'}" title="{xen:phrase rating_4}"></button
					><button type="submit" name="rating" value="5" class="star {xen:if '{$rating} >= 5', 'Full'}{xen:if '{$rating} >= 4.5 AND {$rating} < 5', 'Half'}" title="{xen:phrase rating_5}"></button>
				</span>
			
				<span class="RatingValue"><span class="Number" itemprop="average">{$rating}</span>/<span itemprop="best">5</span>,</span>
				<span class="Hint">{xen:raw $hint}</span>
			</dd>
		</dl>
		
		<input type="hidden" name="_xfToken" value="{$visitor.csrf_token_page}" />
	</form>
	
<xen:else />
	
	<div class="rating">
		<dl>
			<dt class="prompt muted">{xen:raw $prompt}</dt>
			<dd>		
				<span class="ratings" title="{xen:number $rating, 2}">
					 <span class="star {xen:if '{$rating} >= 1', 'Full'}{xen:if '{$rating} >= 0.5 AND {$rating} < 1', 'Half'}"></span
					><span class="star {xen:if '{$rating} >= 2', 'Full'}{xen:if '{$rating} >= 1.5 AND {$rating} < 2', 'Half'}"></span
					><span class="star {xen:if '{$rating} >= 3', 'Full'}{xen:if '{$rating} >= 2.5 AND {$rating} < 3', 'Half'}"></span
					><span class="star {xen:if '{$rating} >= 4', 'Full'}{xen:if '{$rating} >= 3.5 AND {$rating} < 4', 'Half'}"></span
					><span class="star {xen:if '{$rating} >= 5', 'Full'}{xen:if '{$rating} >= 4.5 AND {$rating} < 5', 'Half'}"></span>
				</span>
				
				<span class="RatingValue"><span class="Number" itemprop="average">{$rating}</span>/<span itemprop="best">5</span>,</span>
				<span class="Hint">{xen:raw $hint}</span>
			</dd>
		</dl>	
	</div>

</xen:if>
