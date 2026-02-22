<?php
define('IN_PHPBB', true);
require_once __DIR__ . '/common.php';
if (session_status() !== PHP_SESSION_ACTIVE) session_start();
$error = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $username = trim($_POST['username'] ?? '');
  $password = $_POST['password'] ?? '';
  if (strlen($username) < 3) $error = 'Username too short.';
  elseif (strlen($password) < 6) $error = 'Password too short.';
  else {
    $u = $db->sql_escape($username);
    $res = $db->sql_query("SELECT user_id FROM ".USERS_TABLE." WHERE username='".$u."' LIMIT 1");
    if ($db->sql_fetchrow($res)) $error = 'Username already taken.';
    else {
      $hash = password_hash($password, PASSWORD_BCRYPT);
      $h = $db->sql_escape($hash);
      $db->sql_query("INSERT INTO ".USERS_TABLE." (username,user_password,user_points,user_posts,user_adr_ban) VALUES ('".$u."','".$h."',0,0,0)");
      $_SESSION['user_id'] = $db->insert_id();
      redirect('adr_character.php');
    }
  }
}
?>
<!doctype html><html><head><meta charset="utf-8"><title>Register</title>
<style>body{font-family:system-ui;background:#0b0f14;color:#e8e8e8;display:flex;align-items:center;justify-content:center;height:100vh} .card{width:420px;background:#121924;border:1px solid #1f2a3a;border-radius:14px;padding:20px} input{width:100%;padding:10px;border-radius:10px;border:1px solid #2a3a52;background:#0b0f14;color:#e8e8e8} button{width:100%;padding:10px;border-radius:10px;border:0;background:#d2b36c;color:#111;font-weight:700;margin-top:10px;cursor:pointer} .muted{color:#9fb0c5;font-size:13px} a{color:#d2b36c}</style>
</head><body>
<div class="card">
<h2>Create account</h2>
<?php if ($error) echo '<p style="color:#ffb4b4">'.htmlspecialchars($error).'</p>'; ?>
<form method="post">
<label class="muted">Username</label>
<input name="username" autocomplete="username" />
<label class="muted" style="display:block;margin-top:10px">Password</label>
<input name="password" type="password" autocomplete="new-password" />
<button type="submit">Create</button>
</form>
<p class="muted" style="margin-top:10px">Have an account? <a href="login.php">Login</a></p>
</div>
</body></html>
