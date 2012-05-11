<!-- set thumbnail url -->
<g:if test="${row.thumbnail != null && row.isVideo==true}">
	<g:set var="thumbnail_src" value="${row.thumbnail}"/>
</g:if>
<g:elseif test="${row.isVideo == false }">
	<g:set var="thumbnail_src" value="${resource(dir: 'images', file: 'audio_default.png')}"/>
</g:elseif>
<g:else>
	<g:set var="thumbnail_src" value="${resource(dir: 'images', file: 'video_default.jpg')}"/>
</g:else>

<!-- set duration -->
<g:if test="${row.duration == -1}">
	<g:set var="duration" value="unknown"/>
</g:if>
<g:else>
	<g:set var="duration" value="${row.duration }"/>
</g:else>

<!-- set title depending on length -->
<g:if test="${row.title?.size() > 50}">
	<g:set var="title" value="${row.title?.substring(0,50)+'...'}"/>
</g:if>
<g:else>
	<g:set var="title" value="${row.title}"/>
</g:else>

<div class="recording-row row">
	<div class="span2">	
		<div style="position:relative">	
			<g:link controller='recording' action='replay' id="${row.id}" title="play ${row.title}">				
			<img style="width: 120px; height: 90px;" src="${thumbnail_src}"/>
			<div style="position:absolute;z-index:1;left:0;bottom:0">
				<span class="label label-inverse label-duration">${duration}</span>
			</div>
			</g:link>
		</div>
	</div>
	<div class="span8">
	  	<h3 class="heading-inline">${title}</h3>
	  	<div class="pull-right">
	  		<g:render template="/common/permbar" model="['perm_val':row.perm_val,'perm_name':row.perm_name]"/>
	  	</div>
	  	<g:if test="${row.cc == true}">
	  	<div class="pull-right">
	  		<span class="badge" style="margin-right: 5px;">cc</span>
	  	</div>	
	 	</g:if>
	  	<br/>
	  	<div>
	  		<g:if test="${row.owner_name != null}">
	  			<span class="owner-info">by ${row.owner_name} |</span>
	  		</g:if>
	  		<span class="datetime-info">${row.date_created}</span>
	  	</div>
	  	<br>
	  	<div class="row" style="padding: 5px 0px;">
	  		<div class="span1">
	  			<span title="number of views"><i class="icon-signal metrics-item"></i>${row.views}</span></div>
	  		<div class="span1">
	  			<span title="number of synmarks"><i class="icon-comment metrics-item"></i>${row.synmarks_count}</span></div>
	  		<div class="span1"><span title="number of slides"><i class="icon-picture metrics-item"></i>${row.slides_count}</span>
	  		</div>
	  	</div>
	  	<div class="btn-group pull-right">
	 		<a href="#" data-toggle="dropdown" class="btn dropdown-toggle">
	  			Actions<span class="caret"></span></a>
	  		<ul class="dropdown-menu">
	  				<li><g:link controller="multimediaResource" action="replay" id="${row.id}">Details</g:link></li>
	  				<g:if test="${editable}">
	  				<li><g:link controller="multimediaResource" action="replay" id="${row.id}">Edit</g:link></li>
	  				</g:if>
	  				<li class="divider"></li>
	  				<li><g:link controller="recording" action="replay" id="${row.id}">Play it in Synote Player</g:link></li>
	  				<li><g:link controller="recording" action="print" id="${row.id}">Print Friendly Version</g:link></li>
	 		</ul>
	 	</div>
	</div>
</div>