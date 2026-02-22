CREATE TABLE IF NOT EXISTS phpbb_config (
  config_name varchar(255) NOT NULL,
  config_value varchar(255) NOT NULL,
  PRIMARY KEY (config_name)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS phpbb_users (
  user_id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(255) NOT NULL,
  user_password varchar(255) NOT NULL,
  user_points int(11) NOT NULL DEFAULT 0,
  user_posts int(11) NOT NULL DEFAULT 0,
  user_adr_ban tinyint(1) NOT NULL DEFAULT 0,
  user_level tinyint(4) NOT NULL DEFAULT 0,
  user_avatar_type tinyint(2) NOT NULL DEFAULT 0,
  user_allowavatar tinyint(1) NOT NULL DEFAULT 1,
  user_avatar varchar(255) NOT NULL DEFAULT '',
  user_cell_time int(11) NOT NULL DEFAULT 0,
  user_cell_time_judgement int(11) NOT NULL DEFAULT 0,
  user_cell_caution int(8) NOT NULL DEFAULT 0,
  user_cell_sentence text,
  user_cell_enable_caution int(8) NOT NULL DEFAULT 0,
  user_cell_enable_free int(8) NOT NULL DEFAULT 0,
  user_cell_celleds int(8) NOT NULL DEFAULT 0,
  user_cell_punishment tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (user_id),
  UNIQUE KEY uq_username (username)
) ENGINE=InnoDB;

-- phpBB stub tables (not used for forum features, but referenced by ADR code)
CREATE TABLE IF NOT EXISTS phpbb_sessions (
  session_id varchar(32) NOT NULL DEFAULT '',
  session_user_id int(11) NOT NULL DEFAULT 0,
  session_start int(11) NOT NULL DEFAULT 0,
  session_time int(11) NOT NULL DEFAULT 0,
  session_ip varchar(40) NOT NULL DEFAULT '',
  session_logged_in tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (session_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS phpbb_words (
  word_id int(11) NOT NULL AUTO_INCREMENT,
  word varchar(100) NOT NULL DEFAULT '',
  replacement varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (word_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS phpbb_privmsgs (
  privmsgs_id int(11) NOT NULL AUTO_INCREMENT,
  privmsgs_type tinyint(4) NOT NULL DEFAULT 0,
  privmsgs_subject varchar(255) NOT NULL DEFAULT '',
  privmsgs_from_userid int(11) NOT NULL DEFAULT 0,
  privmsgs_to_userid int(11) NOT NULL DEFAULT 0,
  privmsgs_date int(11) NOT NULL DEFAULT 0,
  privmsgs_ip varchar(40) NOT NULL DEFAULT '',
  privmsgs_enable_html tinyint(1) NOT NULL DEFAULT 0,
  privmsgs_enable_bbcode tinyint(1) NOT NULL DEFAULT 0,
  privmsgs_enable_smilies tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (privmsgs_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS phpbb_privmsgs_text (
  privmsgs_text_id int(11) NOT NULL DEFAULT 0,
  privmsgs_bbcode_uid varchar(10) NOT NULL DEFAULT '',
  privmsgs_text text,
  PRIMARY KEY (privmsgs_text_id)
) ENGINE=InnoDB;

-- minimal defaults
INSERT IGNORE INTO phpbb_config (config_name, config_value) VALUES ('default_lang','english');
INSERT IGNORE INTO phpbb_config (config_name, config_value) VALUES ('points_name','Gold');
INSERT IGNORE INTO phpbb_config (config_name, config_value) VALUES ('script_path', '/');
INSERT IGNORE INTO phpbb_config (config_name, config_value) VALUES ('server_name', 'localhost');
INSERT IGNORE INTO phpbb_config (config_name, config_value) VALUES ('cookie_secure', '0');
INSERT IGNORE INTO phpbb_config (config_name, config_value) VALUES ('server_port', '80');
INSERT IGNORE INTO phpbb_config (config_name, config_value) VALUES ('allow_avatar_upload', '0');
INSERT IGNORE INTO phpbb_config (config_name, config_value) VALUES ('avatar_path', 'images/avatars');
INSERT IGNORE INTO phpbb_config (config_name, config_value) VALUES ('allow_avatar_remote', '0');
INSERT IGNORE INTO phpbb_config (config_name, config_value) VALUES ('allow_avatar_local', '0');
INSERT IGNORE INTO phpbb_config (config_name, config_value) VALUES ('avatar_gallery_path', 'images/avatars/gallery');
INSERT IGNORE INTO phpbb_config (config_name, config_value) VALUES ('topics_per_page', '25');
