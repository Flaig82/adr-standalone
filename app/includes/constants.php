<?php
// Minimal phpBB2-compatible constants used by ADR
if (!isset($table_prefix)) { $table_prefix = 'phpbb_'; }

define('GENERAL_MESSAGE', 200);
define('GENERAL_ERROR', 201);
define('CRITICAL_ERROR', 202);
define('CRITICAL_MESSAGE', 203);

define('USERS_TABLE', $table_prefix . 'users');
define('CONFIG_TABLE', $table_prefix . 'config');
define('SESSIONS_TABLE', $table_prefix . 'sessions');
define('WORDS_TABLE', $table_prefix . 'words');
define('PRIVMSGS_TABLE', $table_prefix . 'privmsgs');
define('PRIVMSGS_TEXT_TABLE', $table_prefix . 'privmsgs_text');
define('PRIVMSGS_NEW_MAIL', 0);
define('PRIVMSGS_READ_MAIL', 1);
define('PRIVMSGS_UNREAD_MAIL', 5);

// phpBB user levels
define('ADMIN', 1);
define('MOD', 2);
define('USER', 0);

// Avatar types
define('USER_AVATAR_NONE', 0);
define('USER_AVATAR_UPLOAD', 1);
define('USER_AVATAR_REMOTE', 2);
define('USER_AVATAR_GALLERY', 3);

// phpBB-ish
define('POST_USERS_URL', 'u');
define('PAGE_ADR', 1001);
?>
