<li class="Alert listItem{xen:if '{$alert.new}', ' new'}{xen:if '{$alert.unviewed}', ' unviewed'} PopupItemLink" id="alert{$alert.alert_id}" data-author="{$alert.user.username}">

	<xen:avatar user="$alert.user" size="s" img="true" class="plainImage" />
	
	<div class="listItemText">
		<h3>{xen:raw $alert.template}</h3>
	
		<xen:datetime time="$alert.event_date" class="muted time" /><xen:if is="{$alert.new}"><span class="newIcon"><i class="fa fa-star"></i></span></xen:if>
	</div>
</li>
