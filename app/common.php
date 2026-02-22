<?php
// Standalone bootstrap emulating phpBB globals needed by ADR
error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING & ~E_DEPRECATED);
require_once __DIR__ . '/config.php';
$table_prefix = $adr_config['table_prefix'];
require_once __DIR__ . '/includes/constants.php';
require_once __DIR__ . '/includes/db.php';
require_once __DIR__ . '/includes/template.php';

$phpbb_root_path = './';
$phpEx = 'php';

// DB
$db = new AdrDb($adr_config['db_host'], $adr_config['db_user'], $adr_config['db_pass'], $adr_config['db_name']);

// Load board_config from CONFIG_TABLE
$board_config = [];
$res = $db->sql_query("SELECT config_name, config_value FROM " . CONFIG_TABLE);
if ($res) {
  while ($row = $db->sql_fetchrow($res)) {
    $board_config[$row['config_name']] = $row['config_value'];
  }
}
$board_config['default_lang'] = $board_config['default_lang'] ?? 'english';
$board_config['points_name'] = $board_config['points_name'] ?? 'Gold';
$board_config['topics_per_page'] = $board_config['topics_per_page'] ?? 25;

// Simple lang stub until ADR loads its own language file
$lang = [];
$lang['Select'] = 'Select';
$lang['Submit'] = 'Submit';
$lang['Yes'] = 'Yes';
$lang['No'] = 'No';
$lang['Go'] = 'Go';
$lang['Order'] = 'Order';
$lang['Sort'] = 'Sort';
$lang['Select_sort_method'] = 'Sort by';
$lang['Sort_Ascending'] = 'Ascending';
$lang['Sort_Descending'] = 'Descending';
$lang['Page_of'] = 'Page %d of %d';
$lang['Goto_page'] = 'Go to page';

// phpBB theme stub
$theme = [
  'template_name' => 'subSilver',
  'td_class1' => 'row1',
  'td_class2' => 'row2',
];

// Template root: the main app dir so adr/templates/ paths resolve correctly
$template = new Template(__DIR__);

// PHP compat: old phpBB2 used $HTTP_GET_VARS / $HTTP_POST_VARS
$HTTP_GET_VARS = &$_GET;
$HTTP_POST_VARS = &$_POST;

$user_ip = $_SERVER['REMOTE_ADDR'] ?? '127.0.0.1';

function message_die($msg_code, $message = '', $title = '', $line = 0, $file = '', $sql = '') {
  echo '<!DOCTYPE html><html><head><meta charset="utf-8"><title>ADR</title>';
  echo '<style>body{font-family:system-ui,sans-serif;max-width:900px;margin:40px auto;padding:0 20px;background:#1a1a2e;color:#e0e0e0}';
  echo 'h1{color:#e94560}a{color:#0f3460}pre{white-space:pre-wrap;background:#16213e;color:#e0e0e0;padding:12px;border-radius:8px}</style>';
  echo '</head><body>';
  echo "<h1>ADR</h1>";
  if ($title) echo "<h2>".htmlspecialchars($title)."</h2>";
  echo "<div>";
  echo is_string($message) ? $message : 'An error occurred.';
  if ($sql && $msg_code != GENERAL_MESSAGE) {
    echo "<pre>".htmlspecialchars($sql)."</pre>";
  }
  echo "</div>";
  echo '</body></html>';
  exit;
}

function append_sid($url, $non_html_amp = false) {
  return $url;
}

// phpBB2 date formatting
function create_date($format, $timestamp, $tz = 0) {
  return date($format, $timestamp);
}

function redirect($url) {
  header('Location: '.$url);
  exit;
}

function session_pagestart($user_ip, $page_id) {
  if (session_status() !== PHP_SESSION_ACTIVE) session_start();
  $uid = $_SESSION['user_id'] ?? 0;
  if ($uid) {
    $uid = intval($uid);
    global $db;
    $res = $db->sql_query("SELECT * FROM ".USERS_TABLE." WHERE user_id=$uid");
    $u = $db->sql_fetchrow($res);
    if ($u) {
      $u['session_logged_in'] = true;
      $u['user_level'] = intval($u['user_level'] ?? 0);
      return $u;
    }
  }
  return [
    'user_id' => 0,
    'username' => 'Guest',
    'session_logged_in' => false,
    'user_points' => 0,
    'user_posts' => 0,
    'user_level' => 0,
    'user_adr_ban' => 0,
    'user_cell_time' => 0,
    'user_avatar_type' => 0,
    'user_allowavatar' => 0,
    'user_avatar' => '',
  ];
}

function init_userprefs($userdata) { /* no-op */ }

function get_userdata($user_id) {
  $user_id = intval($user_id);
  global $db;
  $res = $db->sql_query("SELECT * FROM ".USERS_TABLE." WHERE user_id=$user_id");
  $u = $db->sql_fetchrow($res);
  return $u ?: false;
}

// Pagination helper (phpBB2 style)
function generate_pagination($base_url, $num_items, $per_page, $start_item) {
  $total_pages = max(1, ceil($num_items / $per_page));
  $on_page = floor($start_item / $per_page) + 1;
  $page_string = '';
  if ($total_pages > 1) {
    for ($i = 1; $i <= $total_pages; $i++) {
      $s = ($i - 1) * $per_page;
      if ($i == $on_page) {
        $page_string .= '<b>'.$i.'</b>&nbsp;';
      } else {
        $page_string .= '<a href="'.append_sid($base_url."&amp;start=$s").'">'.$i.'</a>&nbsp;';
      }
    }
  }
  return $page_string;
}

// No-op PM sending (forum integration not needed)
function adr_send_pm($to_id, $subject, $message, $from_id = 2) {
  // Stub: PMs are a forum feature, skip in standalone mode
}
?>
