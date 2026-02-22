<?php
// Minimal page header. Outputs HTML head + dark-themed phpBB2 CSS.
if (!isset($template)) { return; }

if (!defined('HEADER_INC')) {
  define('HEADER_INC', TRUE);

  echo '<!DOCTYPE html><html><head><meta charset="utf-8"><title>ADR Standalone</title>';
  echo '<style>
* { box-sizing: border-box; }
body { font-family: Verdana, Arial, Helvetica, sans-serif; background: #1a1a2e; color: #e0e0e0; margin: 0; padding: 10px 20px; font-size: 12px; }
a { color: #e94560; text-decoration: none; } a:hover { color: #ff6f91; text-decoration: underline; }
a.nav { color: #a0b0c0; }
a.genmed { color: #e0e0e0; } a.genmed:hover { color: #ff6f91; }
a.gensmall { color: #c0c0c0; } a.gensmall:hover { color: #ff6f91; }
table { border-collapse: collapse; }
td, th { padding: 4px 8px; }
th { background: #533483; color: #fff; font-size: 11px; font-weight: bold; padding: 6px 8px; }
.forumline { border: 1px solid #2a3a52; }
.row1 { background: #16213e; color: #e0e0e0; }
.row2 { background: #0f3460; color: #e0e0e0; }
.row3 { background: #1a1a2e; color: #e0e0e0; }
.catHead { background: #533483; color: #fff; font-weight: bold; }
.catBottom { background: #2a3a52; }
.gen, .genmed { font-size: 12px; color: #e0e0e0; }
.gensmall { font-size: 11px; color: #c0c0c0; }
.nav { font-size: 11px; color: #a0b0c0; }
.cattitle { font-weight: bold; font-size: 14px; color: #e94560; }
span.gen b { color: #d2b36c; }
input, select, textarea { background: #16213e; color: #e0e0e0; border: 1px solid #2a3a52; padding: 4px 8px; font-size: 12px; border-radius: 3px; }
input[type=submit], input[type=button], .mainoption, .liteoption { background: #e94560; color: #fff; border: none; padding: 6px 16px; cursor: pointer; border-radius: 4px; font-weight: bold; }
input[type=submit]:hover, input[type=button]:hover { background: #ff6f91; }
.liteoption { background: #533483; font-size: 11px; padding: 4px 10px; }
input[type=radio], input[type=checkbox] { accent-color: #e94560; }
img { max-width: 100%; }
</style>';
  echo '</head><body>';
}

$template->assign_vars([
  'S_TIMEZONE' => '',
  'S_CONTENT_DIRECTION' => 'ltr',
  'S_CONTENT_ENCODING' => 'UTF-8',
  'T_BODY_BGCOLOR' => '#1a1a2e',
  'T_BODY_TEXT' => '#e0e0e0',
  'T_BODY_LINK' => '#e94560',
  'T_BODY_VLINK' => '#e94560',
  'T_BODY_HLINK' => '#ff6f91',
  'T_TR_COLOR1' => '#16213e',
  'T_TR_COLOR2' => '#0f3460',
  'T_TR_COLOR3' => '#16213e',
  'T_TR_CLASS1' => 'row1',
  'T_TR_CLASS2' => 'row2',
  'T_TR_CLASS3' => 'row3',
  'T_TH_COLOR1' => '#e94560',
  'T_TH_COLOR2' => '#533483',
  'T_TH_COLOR3' => '#1a1a2e',
  'T_TH_CLASS1' => 'thHead',
  'T_TH_CLASS2' => 'thSub',
  'T_TH_CLASS3' => 'thTop',
  'T_TD_COLOR1' => '#16213e',
  'T_TD_COLOR2' => '#0f3460',
  'T_TD_COLOR3' => '#1a1a2e',
  'T_TD_CLASS1' => 'row1',
  'T_TD_CLASS2' => 'row2',
  'T_TD_CLASS3' => 'row3',
  'T_FONTFACE1' => 'Verdana, Arial, Helvetica, sans-serif',
  'T_FONTFACE2' => 'Verdana, Arial, Helvetica, sans-serif',
  'T_FONTSIZE1' => '11',
  'T_FONTSIZE2' => '12',
  'T_FONTSIZE3' => '14',
  'T_FONTCOLOR1' => '#e0e0e0',
  'T_FONTCOLOR2' => '#c0c0c0',
  'T_FONTCOLOR3' => '#e94560',
  'U_INDEX' => 'index.php',
  'L_INDEX' => 'Home',
  'PAGINATION' => '',
  'PAGE_NUMBER' => '',
  'L_GOTO_PAGE' => 'Go to page',
  'SITENAME' => 'ADR Standalone',
  'S_CHARACTER_ACTION' => htmlspecialchars($_SERVER['REQUEST_URI'] ?? $_SERVER['PHP_SELF'] ?? ''),
]);
?>
