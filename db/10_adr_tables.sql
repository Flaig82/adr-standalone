INSERT INTO phpbb_config (config_name, config_value) VALUES ('stock_use', '1');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('stock_time', '86400');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('stock_last_change', '0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('Adr_experience_for_new', '10');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('Adr_experience_for_reply', '5');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('Adr_experience_for_edit', '1');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('Adr_use_cache_system', '0-0-0-0-0-0-0-0-0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('Adr_topics_display', '1-1-0-0-0-1');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('Adr_profile_display', '1');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('Adr_time_start', UNIX_TIMESTAMP());
INSERT INTO phpbb_config (config_name, config_value) VALUES ('Adr_character_age', '16');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('Adr_skill_sp_enable', '0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('Adr_character_sp_enable', '0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('Adr_thief_enable', '1');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('Adr_thief_points', '5');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('Adr_warehouse_duration', '1');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('Adr_shop_duration', '1');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('Adr_warehouse_tax', '10');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('Adr_shop_tax', '10');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('Adr_version', '0.4.5');


CREATE TABLE phpbb_adr_alignments (
  alignment_id smallint(8) NOT NULL default '0',
  alignment_name varchar(255) NOT NULL default '',
  alignment_desc text,
  alignment_level tinyint(1) NOT NULL default '0',
  alignment_img varchar(255) NOT NULL default '',
  PRIMARY KEY  (alignment_id)
) ENGINE=InnoDB;

CREATE TABLE phpbb_adr_battle_list (
  battle_id int(8) NOT NULL auto_increment,
  battle_type tinyint(1) NOT NULL default '0',
  battle_turn tinyint(1) NOT NULL default '0',
  battle_result tinyint(1) NOT NULL default '0',
  battle_text text,
  battle_challenger_equipment_info varchar(255) NOT NULL default '',
  battle_round int(12) NOT NULL default '0',
  battle_start int(12) NOT NULL default '0',
  battle_finish int(12) NOT NULL default '0',
  battle_challenger_id int(8) NOT NULL default '0',
  battle_challenger_hp int(8) NOT NULL default '0',
  battle_challenger_mp int(8) NOT NULL default '0',
  battle_challenger_att int(8) NOT NULL default '0',
  battle_challenger_def int(8) NOT NULL default '0',
  battle_challenger_magic_attack int(8) NOT NULL default '0',
  battle_challenger_magic_resistance int(8) NOT NULL default '0',
  battle_challenger_dmg int(8) NOT NULL default '0',
  battle_challenger_element int(3) NOT NULL default '0',
  battle_opponent_id int(8) NOT NULL default '0',
  battle_opponent_hp int(8) NOT NULL default '0',
  battle_opponent_mp int(8) NOT NULL default '0',
  battle_opponent_att int(8) NOT NULL default '0',
  battle_opponent_def int(8) NOT NULL default '0',
  battle_opponent_magic_attack int(8) NOT NULL default '0',
  battle_opponent_magic_resistance int(8) NOT NULL default '0',
  battle_opponent_mp_power int(8) NOT NULL default '0',
  battle_opponent_sp int(12) NOT NULL default '0',
  battle_opponent_dmg int(8) NOT NULL default '0',
  battle_opponent_hp_max int(8) NOT NULL default '0',
  battle_opponent_mp_max int(8) NOT NULL default '0',
  battle_opponent_element int(3) NOT NULL default '0',
  PRIMARY KEY  (battle_id)
) ENGINE=InnoDB;

CREATE TABLE phpbb_adr_battle_monsters (
  monster_id int(8) NOT NULL default '0',
  monster_name varchar(255) NOT NULL default '',
  monster_img varchar(255) NOT NULL default '',
  monster_level int(8) NOT NULL default '0',
  monster_base_hp int(8) NOT NULL default '0',
  monster_base_att int(8) NOT NULL default '0',
  monster_base_def int(8) NOT NULL default '0',
  monster_base_mp int(8) NOT NULL default '10',
  monster_base_mp_power int(8) NOT NULL default '1',
  monster_base_custom_spell varchar(255) NOT NULL default 'a magical spell',
  monster_base_magic_attack int(8) NOT NULL default '10',
  monster_base_magic_resistance int(8) NOT NULL default '10',
  monster_base_sp int(8) NOT NULL default '0',
  monster_thief_skill int(3) NOT NULL default '0',
  monster_base_element int(3) NOT NULL default '1',
  PRIMARY KEY  (monster_id)
) ENGINE=InnoDB;

CREATE TABLE phpbb_adr_battle_pvp (
  battle_id int(8) NOT NULL auto_increment,
  battle_turn int(8) NOT NULL default '0',
  battle_result tinyint(1) NOT NULL default '0',
  battle_text text,
  battle_text_chat text,
  battle_start int(12) NOT NULL default '0',
  battle_finish int(12) NOT NULL default '0',
  battle_challenger_id int(8) NOT NULL default '0',
  battle_challenger_att int(8) NOT NULL default '0',
  battle_challenger_def int(8) NOT NULL default '0',
  battle_challenger_hp int(8) NOT NULL default '0',
  battle_challenger_mp int(8) NOT NULL default '0',
  battle_challenger_hp_max int(8) NOT NULL default '0',
  battle_challenger_mp_max int(8) NOT NULL default '0',
  battle_challenger_hp_regen int(8) NOT NULL default '0',
  battle_challenger_mp_regen int(8) NOT NULL default '0',
  battle_challenger_dmg int(8) NOT NULL default '0',
  battle_challenger_magic_attack int(8) NOT NULL default '0',
  battle_challenger_magic_resistance int(8) NOT NULL default '0',
  battle_challenger_element int(3) NOT NULL default '0',
  battle_opponent_id int(8) NOT NULL default '0',
  battle_opponent_att int(8) NOT NULL default '0',
  battle_opponent_def int(8) NOT NULL default '0',
  battle_opponent_hp int(8) NOT NULL default '0',
  battle_opponent_mp int(8) NOT NULL default '0',
  battle_opponent_hp_max int(8) NOT NULL default '0',
  battle_opponent_mp_max int(8) NOT NULL default '0',
  battle_opponent_hp_regen int(8) NOT NULL default '0',
  battle_opponent_mp_regen int(8) NOT NULL default '0',
  battle_opponent_dmg int(8) NOT NULL default '0',
  battle_opponent_magic_attack int(8) NOT NULL default '0',
  battle_opponent_magic_resistance int(8) NOT NULL default '0',
  battle_opponent_element int(3) NOT NULL default '0',
  PRIMARY KEY  (battle_id)
) ENGINE=InnoDB;

CREATE TABLE phpbb_adr_characters (
  character_id int(8) NOT NULL default '0',
  character_name varchar(255) NOT NULL default '',
  character_desc text,
  character_race int(8) NOT NULL default '0',
  character_class int(8) NOT NULL default '0',
  character_alignment int(8) NOT NULL default '0',
  character_element int(8) NOT NULL default '0',
  character_hp int(8) NOT NULL default '0',
  character_hp_max int(8) NOT NULL default '0',
  character_mp int(8) NOT NULL default '0',
  character_mp_max int(8) NOT NULL default '0',
  character_ac int(8) NOT NULL default '0',
  character_xp int(11) NOT NULL default '0',
  character_level int(8) NOT NULL default '1',
  character_might int(8) NOT NULL default '0',
  character_dexterity int(8) NOT NULL default '0',
  character_constitution int(8) NOT NULL default '0',
  character_intelligence int(8) NOT NULL default '0',
  character_wisdom int(8) NOT NULL default '0',
  character_charisma int(8) NOT NULL default '0',
  character_birth int(12) NOT NULL default '1093694853',
  character_limit_update int(8) NOT NULL default '1',
  character_battle_limit int(3) NOT NULL default '20',
  character_skill_limit int(3) NOT NULL default '30',
  character_trading_limit int(3) NOT NULL default '30',
  character_thief_limit int(3) NOT NULL default '10',
  character_sp int(12) NOT NULL default '0',
  character_magic_attack int(8) NOT NULL default '10',
  character_magic_resistance int(8) NOT NULL default '10',
  character_warehouse tinyint(1) NOT NULL default '0',
  character_warehouse_update int(8) NOT NULL default '0',
  character_shop_update int(8) NOT NULL default '0',
  character_skill_mining int(8) UNSIGNED NOT NULL default '0',
  character_skill_stone int(8) UNSIGNED NOT NULL default '0',
  character_skill_forge int(8) UNSIGNED NOT NULL default '0',
  character_skill_enchantment int(8) UNSIGNED NOT NULL default '0',
  character_skill_trading int(8) UNSIGNED NOT NULL default '0',
  character_skill_thief int(8) UNSIGNED NOT NULL default '0',
  character_skill_mining_uses int(8) UNSIGNED NOT NULL default '0',
  character_skill_stone_uses int(8) UNSIGNED NOT NULL default '0',
  character_skill_forge_uses int(8) UNSIGNED NOT NULL default '0',
  character_skill_enchantment_uses int(8) UNSIGNED NOT NULL default '0',
  character_skill_trading_uses int(8) UNSIGNED NOT NULL default '0',
  character_skill_thief_uses int(8) UNSIGNED NOT NULL default '0',
  character_victories int(8) NOT NULL default '0',
  character_defeats int(8) NOT NULL default '0',
  character_flees int(8) NOT NULL default '0',
  prefs_pvp_notif_pm tinyint(1) NOT NULL default '1',
  prefs_pvp_allow tinyint(1) NOT NULL default '1',
  prefs_tax_pm_notify TINYINT(1) NOT NULL default '1',
  equip_armor int(8) NOT NULL default '0',
  equip_buckler int(8) NOT NULL default '0',
  equip_helm int(8) NOT NULL default '0',
  equip_gloves int(8) NOT NULL default '0',
  equip_amulet int(8) NOT NULL default '0',
  equip_ring int(8) NOT NULL default '0',
  character_pref_give_pm int(1) NOT NULL default '1',
  character_pref_seller_pm int(1) NOT NULL default '1', 
  character_double_ko int(8) NOT NULL default '0',
  character_victories_pvp int(8) NOT NULL default '0',
  character_defeats_pvp int(8) NOT NULL default '0',
  character_flees_pvp int(8) NOT NULL default '0',
  character_fp int(12) NOT NULL default '0',
  PRIMARY KEY  (character_id)
) ENGINE=InnoDB;


CREATE TABLE phpbb_adr_classes (
  class_id smallint(8) NOT NULL default '0',
  class_name varchar(255) NOT NULL default '',
  class_desc text,
  class_level tinyint(1) NOT NULL default '0',
  class_img varchar(255) NOT NULL default '',
  class_might_req int(8) NOT NULL default '0',
  class_dexterity_req int(8) NOT NULL default '0',
  class_constitution_req int(8) NOT NULL default '0',
  class_intelligence_req int(8) NOT NULL default '0',
  class_wisdom_req int(8) NOT NULL default '0',
  class_charisma_req int(8) NOT NULL default '0',
  class_base_hp int(8) NOT NULL default '0',
  class_base_mp int(8) NOT NULL default '0',
  class_base_ac int(8) NOT NULL default '0',
  class_update_hp int(8) NOT NULL default '0',
  class_update_mp int(8) NOT NULL default '0',
  class_update_ac int(8) NOT NULL default '0',
  class_update_xp_req int(8) NOT NULL default '0',
  class_update_of int(8) NOT NULL default '0',
  class_update_of_req int(8) NOT NULL default '0',
  class_selectable int(8) NOT NULL default '0',
  class_magic_attack_req int(8) NOT NULL default '0',
  class_magic_resistance_req int(8) NOT NULL default '0',
  PRIMARY KEY  (class_id)
) ENGINE=InnoDB;

CREATE TABLE phpbb_adr_elements (
  element_id smallint(8) NOT NULL default '0',
  element_name varchar(255) NOT NULL default '',
  element_desc text,
  element_level tinyint(1) NOT NULL default '0',
  element_img varchar(255) NOT NULL default '',
  element_skill_mining_bonus int(8) NOT NULL default '0',
  element_skill_stone_bonus int(8) NOT NULL default '0',
  element_skill_forge_bonus int(8) NOT NULL default '0',
  element_skill_enchantment_bonus int(8) NOT NULL default '0',
  element_skill_trading_bonus int(8) NOT NULL default '0',
  element_skill_thief_bonus int(8) NOT NULL default '0',
  element_oppose_strong int(3) NOT NULL default '0',
  element_oppose_strong_dmg int(3) NOT NULL default '100',
  element_oppose_same_dmg int(3) NOT NULL default '100',
  element_oppose_weak int(3) NOT NULL default '0',
  element_oppose_weak_dmg int(3) NOT NULL default '100',
  element_colour varchar(255) NOT NULL default '',
  PRIMARY KEY  (element_id)
) ENGINE=InnoDB;

CREATE TABLE phpbb_adr_general (
  config_name varchar(255) NOT NULL default '0',
  config_value int(15) NOT NULL default '0',
  PRIMARY KEY  (config_name)
) ENGINE=InnoDB;

INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('max_characteristic', 20);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('min_characteristic', 3);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('allow_reroll', 1);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('allow_character_delete', 1);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('allow_shop_steal', 1);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('new_shop_price', 500);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('item_modifier_power', 100);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('skill_trading_power', 2);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('skill_thief_failure_damage', 2000);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('skill_thief_failure_punishment', 1);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('skill_thief_failure_type', 2);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('skill_thief_failure_time', 6);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('vault_loan_enable', 1);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('interests_rate', 4);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('interests_time', 86400);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('loan_interests', 15);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('loan_interests_time', 864000);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('loan_max_sum', 5000);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('loan_requirements', 0);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('stock_max_change', 10);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('stock_min_change', 0);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('vault_enable', 1);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('battle_enable', 1);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('battle_monster_stats_modifier', 150);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('battle_base_exp_min', 10);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('battle_base_exp_max', 40);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('battle_base_exp_modifier', 120);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('battle_base_reward_min', 10);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('battle_base_reward_max', 40);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('battle_base_reward_modifier', 120);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('temple_heal_cost', 100);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('temple_resurrect_cost', 300);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('cell_allow_user_caution', '1');
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('cell_allow_user_judge', '1');
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('cell_allow_user_blank', '1');
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('cell_amount_user_blank', '5000');
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('cell_user_judge_voters', '10');
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('cell_user_judge_posts', '2');
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('item_power_level', 0);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('training_skill_cost', 1000);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('training_charac_cost', 3000);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('training_upgrade_cost', 10000);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('training_allow_change', 1);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('training_change_cost', 100);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('next_level_penalty', '10');
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('battle_pvp_enable', '1');
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('battle_pvp_defies_max', '5');
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('pvp_base_exp_min', 10);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('pvp_base_exp_max', 40);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('pvp_base_exp_modifier', 120);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('pvp_base_reward_min', 10);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('pvp_base_reward_max', 40);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('pvp_base_reward_modifier', 120);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('weight_enable', 1);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('Adr_disable_rpg', 1);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('Adr_limit_regen_duration', 1);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('Adr_character_limit_enable', 1);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('Adr_character_battle_limit', 20);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('Adr_character_skill_limit', 30);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('Adr_character_trading_limit', 30);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('Adr_character_thief_limit', 10);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('battle_base_sp_modifier', 120);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('posts_enable', 0);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('posts_min', 1);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('battle_calc_type', 1);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('Adr_cache_interval', 15);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('Adr_cache_last_updated', 0);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('Adr_shop_steal_sell', 1);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('Adr_shop_steal_min_lvl', 5);
INSERT INTO phpbb_adr_general (config_name, config_value) VALUES ('Adr_shop_steal_show', 0);

CREATE TABLE phpbb_adr_races (
  race_id smallint(8) NOT NULL default '0',
  race_name varchar(255) NOT NULL default '',
  race_desc text,
  race_level tinyint(1) NOT NULL default '0',
  race_img varchar(255) NOT NULL default '',
  race_might_bonus int(8) NOT NULL default '0',
  race_dexterity_bonus int(8) NOT NULL default '0',
  race_constitution_bonus int(8) NOT NULL default '0',
  race_intelligence_bonus int(8) NOT NULL default '0',
  race_wisdom_bonus int(8) NOT NULL default '0',
  race_charisma_bonus int(8) NOT NULL default '0',
  race_skill_mining_bonus int(8) NOT NULL default '0',
  race_skill_stone_bonus int(8) NOT NULL default '0',
  race_skill_forge_bonus int(8) NOT NULL default '0',
  race_skill_enchantment_bonus int(8) NOT NULL default '0',
  race_skill_trading_bonus int(8) NOT NULL default '0',
  race_skill_thief_bonus int(8) NOT NULL default '0',
  race_might_malus int(8) NOT NULL default '0',
  race_dexterity_malus int(8) NOT NULL default '0',
  race_constitution_malus int(8) NOT NULL default '0',
  race_intelligence_malus int(8) NOT NULL default '0',
  race_wisdom_malus int(8) NOT NULL default '0',
  race_charisma_malus int(8) NOT NULL default '0',
  race_weight int(12) NOT NULL default '1000',
  race_weight_per_level int(3) NOT NULL default '5',
  race_magic_attack_bonus int(8) NOT NULL default '0',
  race_magic_resistance_bonus int(8) NOT NULL default '0',
  race_magic_attack_malus int(8) NOT NULL default '0',
  race_magic_resistance_malus int(8) NOT NULL default '0',
  PRIMARY KEY  (race_id)
) ENGINE=InnoDB;

CREATE TABLE phpbb_adr_shops (
  shop_id int(8) NOT NULL default '0',
  shop_owner_id int(8) NOT NULL default '0',
  shop_name varchar(255) NOT NULL default '',
  shop_desc varchar(255) NOT NULL default '',
  shop_last_updated int(12) NOT NULL default '0',
  PRIMARY KEY  (shop_id)
) ENGINE=InnoDB;

CREATE TABLE phpbb_adr_stores (
  store_id int(8) NOT NULL auto_increment,
  store_name varchar(100) NOT NULL default '',
  store_desc varchar(255) NOT NULL default '',
  store_img varchar(255) NOT NULL default '',
  store_status tinyint(1) NOT NULL default '1',
  store_sales_status tinyint(1) NOT NULL default '0',
  store_admin tinyint(1) NOT NULL default '0',
  store_owner_id int(1) NOT NULL default '1',
  KEY store_id (store_id)
) ENGINE=InnoDB;

CREATE TABLE phpbb_adr_stores_stats(
  store_stats_character_id int(12) NOT NULL default '0',
  store_stats_store_id int(12) NOT NULL default '0',
  store_stats_buy_total int(12) NOT NULL default '0',
  store_stats_buy_last int(12) NOT NULL default '0',
  store_stats_sold_total int(12) NOT NULL default '0',
  store_stats_sold_last int(12) NOT NULL default '0',
  store_stats_stolen_item_total int(12) NOT NULL default '0',
  store_stats_stolen_item_fail_total int(12) NOT NULL default '0',
  store_stats_stolen_item_last int(12) NOT NULL default '0',
  store_stats_stolen_points_total int(12) NOT NULL default '0',
  store_stats_stolen_points_last int(12) NOT NULL default '0',
  PRIMARY KEY  (store_stats_character_id, store_stats_store_id)
) ENGINE=InnoDB;

CREATE TABLE phpbb_adr_stores_user_history(
  user_store_trans_id int(12) NOT NULL default '0',
  user_store_owner_id int(8) NOT NULL default '0',
  user_store_info TEXT,
  user_store_total_price int(12) NOT NULL default '0',
  user_store_date int(12) NOT NULL default '0',
  user_store_buyer TEXT,
  PRIMARY KEY(user_store_trans_id, user_store_owner_id)
) ENGINE=InnoDB;

CREATE TABLE phpbb_adr_shops_items (
  item_id int(8) NOT NULL auto_increment,
  item_owner_id int(8) NOT NULL default '0',
  item_price int(8) NOT NULL default '0',
  item_quality int(8) NOT NULL default '0',
  item_power int(8) NOT NULL default '0',
  item_duration int(8) NOT NULL default '0',
  item_duration_max int(8) NOT NULL default '1',
  item_icon varchar(255) NOT NULL default '',
  item_name varchar(255) NOT NULL default '',
  item_desc varchar(255) NOT NULL default '',
  item_type_use int(8) NOT NULL default '16',
  item_in_shop tinyint(1) NOT NULL default '0',
  item_store_id int(8) NOT NULL default '1',
  item_weight int(12) NOT NULL default '25',
  item_auth int(1) NOT NULL default '0',
  item_max_skill int(8) NOT NULL default '25',
  item_add_power int(8) NOT NULL default '0',
  item_mp_use int(8) NOT NULL default '0',
  item_monster_thief tinyint(1) NOT NULL default '0',
  item_element int(4) NOT NULL default '0',
  item_element_str_dmg int(4) NOT NULL default '100',
  item_element_same_dmg int(4) NOT NULL default '100',
  item_element_weak_dmg int(4) NOT NULL default '100',
  item_in_warehouse tinyint(1) NOT NULL default '0',
  item_sell_back_percentage int(3) NOT NULL default '50',
  item_stolen_id int(12) NOT NULL default '0',
  item_steal_dc smallint(3) NOT NULL default '0',
  item_bought_timestamp int(12) NOT NULL default '0',
  item_restrict_align_enable tinyint(1) NOT NULL default '0',
  item_restrict_align varchar(255) NOT NULL default '0',
  item_restrict_class_enable tinyint(1) NOT NULL default '0',
  item_restrict_class varchar(255) NOT NULL default '0',
  item_restrict_element_enable tinyint(1) NOT NULL default '0',
  item_restrict_element varchar(255) NOT NULL default '0',
  item_restrict_race_enable tinyint(1) NOT NULL default '0',
  item_restrict_race varchar(255) NOT NULL default '0',
  item_restrict_level int(8) NOT NULL default '0',
  item_restrict_str int(8) NOT NULL default '0',
  item_restrict_dex int(8) NOT NULL default '0',
  item_restrict_int int(8) NOT NULL default '0',
  item_restrict_wis int(8) NOT NULL default '0',
  item_restrict_cha int(8) NOT NULL default '0',
  item_restrict_con int(8) NOT NULL default '0',
  item_crit_hit smallint(3) NOT NULL default '20',
  item_crit_hit_mod smallint(3) NOT NULL default '2',
  item_stolen_timestamp int(12) NOT NULL default '0',
  item_stolen_by varchar(255) NOT NULL default '',
  item_donated_timestamp int(12) NOT NULL default '0',
  item_donated_by varchar(255) NOT NULL default '',
  KEY item_id (item_id),
  KEY item_owner_id (item_owner_id)
) ENGINE=InnoDB;

CREATE TABLE phpbb_adr_shops_items_quality (
  item_quality_id int(8) NOT NULL default '0',
  item_quality_modifier_price int(8) NOT NULL default '0',
  item_quality_lang varchar(255) NOT NULL default '',
  PRIMARY KEY  (item_quality_id)
) ENGINE=InnoDB;

CREATE TABLE phpbb_adr_shops_items_type (
  item_type_id int(8) NOT NULL default '0',
  item_type_base_price int(8) NOT NULL default '0',
  item_type_lang varchar(255) NOT NULL default '',
  item_type_category varchar(255) NOT NULL default 'Misc',
  item_type_order int(8) NOT NULL default '0',
  PRIMARY KEY  (item_type_id)
) ENGINE=InnoDB;

CREATE TABLE phpbb_adr_skills (
  skill_id tinyint(1) NOT NULL default '0',
  skill_name varchar(255) NOT NULL default '',
  skill_desc text,
  skill_img varchar(255) NOT NULL default '',
  skill_req int(8) NOT NULL default '0',
  skill_chance mediumint(3) NOT NULL default '5',
  PRIMARY KEY  (skill_id)
) ENGINE=InnoDB;

CREATE TABLE phpbb_adr_vault_blacklist (
  user_id int(8) NOT NULL default '0',
  user_due int(8) NOT NULL default '0',
  PRIMARY KEY  (user_id)
) ENGINE=InnoDB;

CREATE TABLE phpbb_adr_vault_exchange (
  stock_id int(8) NOT NULL default '0',
  stock_name varchar(40) NOT NULL default '',
  stock_desc varchar(255) NOT NULL default '',
  stock_price int(8) NOT NULL default '0',
  stock_previous_price int(8) NOT NULL default '0',
  stock_best_price int(8) NOT NULL default '0',
  stock_worst_price int(8) NOT NULL default '0',
  PRIMARY KEY  (stock_id)
) ENGINE=InnoDB;

CREATE TABLE phpbb_adr_vault_exchange_users (
  stock_id mediumint(8) NOT NULL default '0',
  user_id mediumint(8) NOT NULL default '0',
  stock_amount mediumint(8) NOT NULL default '0',
  KEY stock_id (stock_id),
  KEY user_id (user_id)
) ENGINE=InnoDB;

CREATE TABLE phpbb_adr_vault_users (
  owner_id int(8) NOT NULL default '0',
  account_id int(8) NOT NULL default '0',
  account_sum int(8) NOT NULL default '0',
  account_time int(11) NOT NULL default '0',
  loan_sum int(8) NOT NULL default '0',
  loan_time int(11) NOT NULL default '0',
  account_protect tinyint(1) NOT NULL default '0',
  loan_protect tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (owner_id)
) ENGINE=InnoDB;

CREATE TABLE phpbb_adr_jail_users (
  celled_id int(8) NOT NULL default '0',
  user_id int(8) NOT NULL default '0',
  user_cell_date int(11) NOT NULL default '0',
  user_freed_by int(8) NOT NULL default '0',
  user_sentence text,
  user_caution int(8) NOT NULL default '0',
  user_time int(11) NOT NULL default '0',
  PRIMARY KEY  (celled_id)
) ENGINE=InnoDB;

CREATE TABLE phpbb_adr_jail_votes (
  vote_id mediumint(8) NOT NULL default '0',
  voter_id mediumint(8) NOT NULL default '0',
  vote_result mediumint(8) NOT NULL default '0',
  KEY vote_id (vote_id),
  KEY voter_id (voter_id)
) ENGINE=InnoDB;

CREATE TABLE phpbb_adr_create_exploit_fix (
  user_id int(10) NOT NULL default '0',
  power int(8) NOT NULL default '0',
  agility int(8) NOT NULL default '0',
  endurance int(8) NOT NULL default '0',
  intelligence int(8) NOT NULL default '0',
  willpower int(8) NOT NULL default '0',
  charm int(8) NOT NULL default '0',
  magic_attack int(8) NOT NULL default '0',
  magic_resistance int(8) NOT NULL default '0',
  PRIMARY KEY  (user_id)
) ENGINE=InnoDB;

CREATE TABLE phpbb_adr_battle_community(
  chat_id int(10) NOT NULL auto_increment,
  chat_posts int(10) NOT NULL default '0',
  chat_text text,
  chat_date date default NULL,
  PRIMARY KEY (chat_id)
) ENGINE=InnoDB;

CREATE TABLE phpbb_adr_bug_fix(
  fix_id varchar(255) NOT NULL default '',
  fix_install_date int(12) NOT NULL default '0',
  fix_installed_by varchar(255) NOT NULL default '',
  PRIMARY KEY(fix_id)
) ENGINE=InnoDB;
