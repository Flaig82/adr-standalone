<?php

/***************************************************************************
 *                                 adr_battle_community.php
 *                                ---------------------
 *		Version			: 1.0.0
 *		Authors			: aUsTiN 		
 *							[ (austin_inc@hotmail.com) 		(http://phpbb-amod.com) 	]
 *						  Seteo-Bloke 	
 *							[ (admin@phpbb-adr.com) 	(http://www.phpbb-adr.com) 	]
 *
 ***************************************************************************************/

define('IN_PHPBB', true);
define('IN_ADR_BATTLE', true);
define('IN_ADR_CHARACTER', true);
define('IN_ADR_SHOPS', true);

$phpbb_root_path = './';
include_once($phpbb_root_path . 'extension.inc');
include_once($phpbb_root_path . 'common.'.$phpEx);

$loc = 'battle_community';
$sub_loc = 'adr_battle_community';

//
// Start session management
$userdata = session_pagestart($user_ip, PAGE_ADR);
init_userprefs($userdata);
// End session management
//
$user_id = $userdata['user_id'];
$user_points = $userdata['user_points'];
include_once($phpbb_root_path . 'adr/includes/adr_global.'.$phpEx);
include_once($phpbb_root_path . 'adr/includes/adr_functions_global_chat.'.$phpEx);

// Sorry , only logged users ...
if(!$userdata['session_logged_in']){
	$redirect = "adr_battle_community.$phpEx";
	$redirect .= (isset($user_id)) ? '&user_id=' . $user_id : '';
	header('Location: ' . append_sid("login.$phpEx?redirect=$redirect", true));
}

// Get the general config
$adr_general = adr_get_general_config();

// Grab template file etc.
adr_template_file('adr_battle_community_body.tpl');
include_once($phpbb_root_path . 'includes/page_header.'.$phpEx);

$mode = ($_POST['mode']) ? $_POST['mode'] : $_POST['mode'];

//
// Get online users [START].
// Standalone: no phpBB sessions table, so list all characters instead
//
	$online_userlist = '';
	$sql = "SELECT character_id, character_name FROM " . ADR_CHARACTERS_TABLE . "
		WHERE character_id <> '$user_id'
		AND character_id > 1
		ORDER BY character_name ASC";
	$result = $db->sql_query($sql);
	if ($result) {
		while ($row = $db->sql_fetchrow($result)) {
			$user_online_link = '<span class="genmed"><a href="adr_character.' . $phpEx . '?u=' . $row['character_id'] . '">' . $row['character_name'] . '</a></span>';
			$online_userlist .= ($online_userlist != '') ? ', ' . $user_online_link : $user_online_link;
		}
	}
	if ($online_userlist == '') {
		$online_userlist = $lang['Adr_community_no_users_online'] ?? 'No other players found';
	}
//
// Get online users [END]
//

$template->assign_vars(array(
	'U_GLOBAL_CHAT'     => append_sid("adr_global_chat.$phpEx"),
	'U_CHAT_VIEW'       => append_sid("adr_battle_community.$phpEx"),
	'ONLINE_LIST' 		=> $online_userlist,
	'L_COMMUNITY'		=> $lang['Adr_shoutbox_community'],
	'L_ONLINE_LIST'     => $lang['Adr_shoubox_online_list']
));
	
include_once($phpbb_root_path . 'adr/includes/adr_header.'.$phpEx);
$template->pparse('body');
include_once($phpbb_root_path . 'includes/page_tail.'.$phpEx);
?>
