{************************************
******** Individual Comment *********
*************************************}
<!-- comment_show.tpl -->
<li class="comment">
	<a id="c{$comment_id}"></a>
	{checkActionsTpl location="tpl_pligg_story_comments_single_start"}
	<div class="comment-wrapper clearfix" {if $comment_status neq "published"}style="background-color: #FFFBE4;border:1px solid #DFDFDF;"{/if}>
		<div class="comment-left">
			{if $UseAvatars neq "0"}<a href="{$user_view_url}"><img src="{$Avatar.small}" align="absmiddle" class="avatar" alt="{$user_username}" title="{$user_username}" /></a>{/if}      
			{if $Enable_Comment_Voting eq 1}
				<br />
				<div><a id="cvote-{$comment_id}" class="comment_vote_count">{$comment_votes}</a></div>
				{if $comment_user_vote_count eq 0 && $current_userid neq $comment_author}
					<a class="btn btn-xs {if $comment_shakebox_currentuser_votes eq 1}btn-success{else}btn-default{/if}" href="javascript:{$link_shakebox_javascript_votey}"><i class="{if $comment_shakebox_currentuser_votes >= 1}icon-white {/if}icon-thumbs-up"></i></a>
					<a class="btn btn-xs {if $comment_shakebox_currentuser_reports eq 1}btn-danger{else}btn-default{/if}" href="javascript:{$link_shakebox_javascript_voten}"><i class="{if $comment_shakebox_currentuser_reports >= 1}icon-white {/if}icon-thumbs-down"></i></a>
				{/if}
				| 
			{/if}
		</div>
		<div class="span_comment comment-right" id="wholecomment{$comment_id}">

			{if $user_logged_in == $user_userlogin || $isadmin eq 1}
				<div class="btn-group pull-right admin-links">
					<a class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#">
					  <i class="icon-cog"></i>
					  <span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						{if $isadmin eq 1}
							<li><a href="{$my_base_url}{$my_pligg_base}/admin/admin_users.php?mode=view&user={$user_userlogin}">{#PLIGG_Visual_Comment_Manage_User#} {$user_userlogin}</a></li>
							<li><a href="{$edit_comment_url}">{#PLIGG_Visual_Comment_Edit#}</a></li>
							<li><a href="{$delete_comment_url}">{#PLIGG_Visual_Comment_Delete#}</a></li>
						{elseif $user_logged_in == $user_userlogin}
							<li><a href="{$edit_comment_url}">{#PLIGG_Visual_Comment_Edit#}</a></li>
						{/if}
						{checkActionsTpl location="tpl_pligg_story_comments_admin"}
					</ul>
				</div>
			{/if}
			<p class="comment-data">
				<span class="comment-author">
					{if $is_anonymous}
						{#PLIGG_Visual_Comment_Manage_Unregistered#}
					{/if}
					<a href="{$user_view_url}">{$user_username}</a>
					<!-- {if $user_rank neq ''} (#{$user_rank}){/if} -->
				</span>
				<span class="comment-date">
					{$comment_age} {#PLIGG_Visual_Comment_Ago#} 
				</span>
                <span class="comment-reply">
                <a href="#" onclick="show_comments('{$comment_id}')" id="comment-{$comment_id}">Permalink</a>
                </span>
				<span class="comment-reply">
					{if $current_userid neq 0} 
						<a href="#" onclick="show_replay_comment_form('{$comment_id}')" id="comment-reply-{$comment_id}" >{#PLIGG_Visual_Comment_Reply#}</a>
					{/if}
				</span>
				{if $comment_votes lt 0}
					<span class="comment-hide">
						<span id="show_hide_comment_content-{$comment_id}"> <a href = "javascript://"  onclick="var replydisplay=document.getElementById('comment_content-{$comment_id}').style.display ? '' : 'none'; document.getElementById('comment_content-{$comment_id}').style.display = replydisplay;">{#PLIGG_Visual_Comment_Show_Hide#}</a></span>
					</span>
				{/if}
			</p>
			{if $comment_votes gte 0} 
				<p class="comment-content" id="comment_content-{$comment_id}">{$comment_content}</p> 
			{else}
				<p class="comment-content" id="comment_content-{$comment_id}" style="display:none">{$comment_content}</p>
			{/if}
		</div>
	</div>
	{checkActionsTpl location="tpl_pligg_story_comments_single_end"}
</li>
<!--/comment_show.tpl -->