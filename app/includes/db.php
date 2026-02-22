<?php
class AdrDb {
  private $mysqli;
  public function __construct($host,$user,$pass,$db) {
    $this->mysqli = new mysqli($host,$user,$pass,$db);
    if ($this->mysqli->connect_errno) {
      throw new Exception('DB connect failed: '.$this->mysqli->connect_error);
    }
    $this->mysqli->set_charset('utf8');
  }
  public function sql_query($sql) {
    $res = $this->mysqli->query($sql);
    return $res;
  }
  public function sql_fetchrow($result) {
    if (!$result) return false;
    $row = $result->fetch_assoc();
    return $row ?: false;
  }
  public function sql_fetchrowset($result) {
    $rows = [];
    if (!$result) return $rows;
    while ($r = $result->fetch_assoc()) { $rows[] = $r; }
    return $rows;
  }
  public function sql_numrows($result) {
    if (!$result) return 0;
    return $result->num_rows;
  }
  public function sql_escape($s) {
    return $this->mysqli->real_escape_string($s);
  }
  public function insert_id() {
    return $this->mysqli->insert_id;
  }
}
?>
