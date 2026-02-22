<?php
if ( !defined('IN_PHPBB') )
{
	die("Hacking attempt");
}

if (defined('HEADER_INC')) { return; }
define('HEADER_INC', TRUE);

// Standalone: output a simple HTML header
echo '<!DOCTYPE html><html><head><meta charset="utf-8"><title>ADR</title>';
echo '<style>
body { font-family: system-ui, sans-serif; background: #1a1a2e; color: #e0e0e0; margin: 0; padding: 10px; }
a { color: #e94560; } a:hover { color: #ff6f91; }
table { border-collapse: collapse; }
td, th { padding: 4px 8px; }
.row1 { background: #16213e; } .row2 { background: #0f3460; }
.gen, .gensmall, .genmed { font-family: system-ui, sans-serif; font-size: 12px; color: #e0e0e0; }
.cattitle { font-weight: bold; font-size: 14px; color: #e94560; }
input, select, textarea { background: #16213e; color: #e0e0e0; border: 1px solid #533483; padding: 4px; }
input[type=submit] { background: #e94560; color: white; border: none; padding: 6px 16px; cursor: pointer; border-radius: 4px; }
input[type=submit]:hover { background: #ff6f91; }
</style>';
echo '</head><body>';
?>
