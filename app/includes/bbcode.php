<?php
// Minimal phpBB2 BBCode stubs for ADR standalone.
// The original phpBB2 bbcode.php handled smiley replacement and BBCode parsing.
// In standalone mode we just pass text through unchanged.

if (!function_exists('smilies_pass')) {
  function smilies_pass($text) {
    // Strip smiley placeholders but don't convert to images (no smiley packs installed)
    return $text;
  }
}

if (!function_exists('make_bbcode_uid')) {
  function make_bbcode_uid() {
    return substr(md5(mt_rand()), 0, 8);
  }
}

if (!function_exists('bbencode_first_pass')) {
  function bbencode_first_pass($text, $uid) {
    return $text;
  }
}

if (!function_exists('bbencode_second_pass')) {
  function bbencode_second_pass($text, $uid) {
    return $text;
  }
}
?>
