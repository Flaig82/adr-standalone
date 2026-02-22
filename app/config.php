<?php
// Standalone ADR config
$adr_config = [
  'db_host' => getenv('ADR_DB_HOST') ?: 'db',
  'db_name' => getenv('ADR_DB_NAME') ?: 'adr',
  'db_user' => getenv('ADR_DB_USER') ?: 'adr',
  'db_pass' => getenv('ADR_DB_PASS') ?: 'adr',
  'table_prefix' => getenv('ADR_TABLE_PREFIX') ?: 'phpbb_',
];
?>
