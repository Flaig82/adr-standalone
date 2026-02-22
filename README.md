# ADR (Advanced Dungeons & Rabbits) Standalone

A standalone version of **ADR (Adventure/RPG)** — the classic phpBB2 RPG mod — running without phpBB. Built as a reference for exploring the original game systems (battles, inventory, shops, forge, vault, etc.) without needing a full forum install.

Based on ADR v0.4.5.

![PHP](https://img.shields.io/badge/PHP-7.4-blue) ![MySQL](https://img.shields.io/badge/MySQL-8.0-blue) ![Docker](https://img.shields.io/badge/Docker-required-blue)

## Quick Start

**Requirements:** [Docker Desktop](https://www.docker.com/products/docker-desktop/) (Mac, Windows, or Linux)

```bash
git clone <your-repo-url>
cd adr-standalone
docker compose up -d
```

Wait about 10 seconds for MySQL to initialize, then open:

- **Game:** http://localhost:8085
- **phpMyAdmin:** http://localhost:8082 (root / root)

## First Time Setup

1. Go to http://localhost:8085/register.php and create an account
2. Log in and you'll be prompted to create a character (pick race, element, class)
3. Explore! Battle monsters, visit shops, forge items, manage inventory, etc.

## What Works

- **Character creation** — full race/element/class selection with stat rolling
- **Monster battles** — turn-based combat with battle log chatbox
- **Inventory** — equip, sell, give, warehouse, and manage items
- **Shops & Stores** — browse and buy from NPC shops
- **Forge** — mining, stonecutting, forging, and enchanting
- **Vault** — bank account and stock exchange
- **Town** — training grounds and warehouse management
- **Global Chat** — in-game chat system
- **Character profiles** — stats, equipment, skills

## How It Works

ADR was originally a phpBB2 mod that hooked into the forum's user system, templates, and database. This standalone version replaces phpBB with minimal shims:

- **Auth** — Simple PHP session-based registration/login (no forum needed)
- **Database** — Same `phpbb_` table schema so ADR code runs unmodified
- **Templates** — Custom phpBB2-style template engine (`{VARS}`, `<!-- BEGIN/END block -->`, nested blocks)
- **Stubs** — Lightweight replacements for phpBB functions (`session_pagestart`, `message_die`, `append_sid`, etc.)

## Tech Stack

| Service | Port | Details |
|---------|------|---------|
| PHP 7.4 + Apache | 8085 | Game app |
| MySQL 8.0 | 3307 | Database |
| phpMyAdmin | 8082 | DB admin UI |

## Project Structure

```
.
├── docker-compose.yml
├── app/                        # PHP application
│   ├── common.php              # phpBB shims & bootstrap
│   ├── config.php              # DB config (uses env vars)
│   ├── login.php / register.php / logout.php
│   ├── includes/
│   │   ├── template.php        # phpBB2 template engine
│   │   ├── page_header.php     # HTML head + CSS + global vars
│   │   ├── constants.php       # Table name constants
│   │   └── bbcode.php          # BBCode/smiley stubs
│   └── adr/                    # ADR game module (mostly original)
│       ├── includes/           # Game logic
│       ├── templates/          # .tpl template files
│       ├── language/           # Language packs
│       └── images/             # Game art assets
└── db/                         # SQL init scripts (auto-run on first start)
    ├── 00_base.sql             # Core phpBB stub tables
    ├── 10_adr_tables.sql       # ADR schema + config
    └── 20_adr_inserts.sql      # Game data (classes, races, items, monsters)
```

## Troubleshooting

**"Connection refused" on first start**
MySQL takes a few seconds to initialize. Wait 10-15 seconds and refresh.

**Port conflict**
If port 8085 is taken, change it in `docker-compose.yml`:
```yaml
ports:
  - "9090:80"  # change 8085 to any free port
```

**Reset everything**
```bash
docker compose down -v   # -v removes the database volume
docker compose up -d     # fresh start
```

**SQL errors on a page**
Some ADR features reference optional tables or modules. Open phpMyAdmin at http://localhost:8082 to inspect. Most pages work fine.

## Credits

**Original ADR (Adventure/RPG) Mod:**
- **Dr DLP** (Malicious Rabbit) — Original author
- **Seteo-Bloke** — Lead developer from v0.30+ ([phpbb-adr.com](http://www.phpbb-adr.com))
- **Ptirhiik** — Cache system and core contributions
- **aUsTiN** — Battle chatbox system
- **Eric's RPG Team** — Community contributions and testing

**Game Art:**
- [Forum Images](http://www.forumimages.com/) — Item and UI artwork
- [Molotov.nu](http://www.molotov.nu/) — Monster and character artwork
- [Maggie the Jackcat's](http://www.thejackcat.com/AC/) — Additional artwork

**Standalone Adaptation:**
- Stripped phpBB dependency, added Docker setup, phpBB2 template engine, and session shims

## License

ADR is released under the [GNU General Public License v2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html).
