<?php
// phpBB2-style template engine with proper nested block scoping.
// Supports {VARS}, <!-- BEGIN block --> loops, and nested blocks where
// assign_block_vars('parent.child', ...) scopes to the last parent row.
class Template {
  private $root;
  private $vars = [];
  private $block_data = [];  // Hierarchical block data
  private $files = [];
  // phpBB2 cache system accesses _tpldata directly
  public $_tpldata = ['.' => [0 => []]];

  public function __construct($root) {
    $this->root = rtrim($root,'/').'/';
  }

  public function assign_vars($arr) {
    foreach ($arr as $k=>$v) {
      $this->vars[$k] = $v;
      $this->_tpldata['.'][0][$k] = $v;
    }
  }

  // assign_block_vars('parent.child', $data):
  //   Appends $data as a new row of 'child' block scoped to the LAST row of 'parent'.
  // assign_block_vars('block', $data):
  //   Appends $data as a new top-level row of 'block'.
  public function assign_block_vars($block, $arr) {
    $parts = explode('.', $block);
    // Navigate to the correct nesting level
    $ref = &$this->block_data;
    for ($i = 0; $i < count($parts) - 1; $i++) {
      $name = $parts[$i];
      if (!isset($ref[$name]) || empty($ref[$name])) {
        // Parent block doesn't exist yet, create it
        $ref[$name] = [];
      }
      // Go to the last row of this parent block
      $lastIdx = count($ref[$name]) - 1;
      if ($lastIdx < 0) {
        // No rows yet in parent, create one
        $ref[$name][] = ['_vars' => [], '_children' => []];
        $lastIdx = 0;
      }
      if (!isset($ref[$name][$lastIdx]['_children'])) {
        $ref[$name][$lastIdx]['_children'] = [];
      }
      $ref = &$ref[$name][$lastIdx]['_children'];
    }
    // Add the new row to the target block
    $targetBlock = $parts[count($parts) - 1];
    if (!isset($ref[$targetBlock])) {
      $ref[$targetBlock] = [];
    }
    $ref[$targetBlock][] = ['_vars' => $arr, '_children' => []];
  }

  public function set_filenames($arr) {
    foreach ($arr as $handle=>$file) {
      $this->files[$handle] = $file;
    }
  }

  private function resolve_path($file) {
    $path = $this->root . $file;
    if (file_exists($path)) return $path;
    if (file_exists($file)) return $file;
    $alt = './' . $file;
    if (file_exists($alt)) return $alt;
    return $path;
  }

  // Render template blocks. $blockStore is the child-blocks data for the current scope.
  // $varPrefix is the dotted path used for {prefix.VAR} replacement in templates.
  private function render_blocks($tpl, $blockStore, $varPrefix = '') {
    $pattern = '/<!--\s*BEGIN\s+([A-Za-z0-9_]+)\s*-->(.*?)<!--\s*END\s+\1\s*-->/s';
    while (preg_match($pattern, $tpl, $m, PREG_OFFSET_CAPTURE)) {
      $fullMatch = $m[0][0];
      $blockName = $m[1][0];
      $blockBody = $m[2][0];

      $fullPath = $varPrefix ? $varPrefix . '.' . $blockName : $blockName;

      $out = '';
      $rows = $blockStore[$blockName] ?? [];
      foreach ($rows as $rowData) {
        $rowVars = $rowData['_vars'] ?? [];
        $children = $rowData['_children'] ?? [];
        $chunk = $blockBody;
        // Recurse for nested blocks within this row's scope
        $chunk = $this->render_blocks($chunk, $children, $fullPath);
        // Replace block-scoped variables: {full.path.VAR}
        foreach ($rowVars as $k=>$v) {
          $chunk = str_replace('{'.$fullPath.'.'.$k.'}', $v, $chunk);
        }
        // Also replace short form {blockName.VAR} for compat
        foreach ($rowVars as $k=>$v) {
          $chunk = str_replace('{'.$blockName.'.'.$k.'}', $v, $chunk);
        }
        // Replace global variables
        foreach ($this->vars as $k=>$v) {
          $chunk = str_replace('{'.$k.'}', $v, $chunk);
        }
        $out .= $chunk;
      }
      $tpl = substr_replace($tpl, $out, $m[0][1], strlen($fullMatch));
    }
    return $tpl;
  }

  private function load_template($handle) {
    if (!isset($this->files[$handle])) return '';
    $path = $this->resolve_path($this->files[$handle]);
    if (!file_exists($path)) return '';
    return file_get_contents($path);
  }

  // Render a handle and store its output as a template variable
  public function assign_var_from_handle($var_name, $handle) {
    $tpl = $this->load_template($handle);
    $tpl = $this->render_blocks($tpl, $this->block_data);
    foreach ($this->vars as $k=>$v) {
      $tpl = str_replace('{'.$k.'}', $v, $tpl);
    }
    $this->vars[$var_name] = $tpl;
    $this->_tpldata['.'][0][$var_name] = $tpl;
  }

  public function pparse($handle) {
    $tpl = $this->load_template($handle);
    if (!$tpl) {
      echo "<!-- Missing template: " . htmlspecialchars($this->files[$handle] ?? $handle) . " -->";
      return;
    }
    $tpl = $this->render_blocks($tpl, $this->block_data);
    foreach ($this->vars as $k=>$v) {
      $tpl = str_replace('{'.$k.'}', $v, $tpl);
    }
    echo $tpl;
  }
}
?>
