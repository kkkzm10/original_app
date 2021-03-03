# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| --------          | ------ | ----------- |
| last_name         | string | null: false |
| first_name        | string | null: false |
| email              | string | null: false, unique: true|
| password          | string | null: false |
| self_introduction | string | null: false |

### Association

- has_many :chat_room_users
- has_many :chat_rooms, through: chat_room_users
- has_many :chat_messages
- has_many :reactions


## chat_rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: chat_room_users
- has_many :messages


## chat_room_users テーブル

| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| chat_room   | references | null: false, foreign_key: true |

### Association

- belongs_to :chat_room
- belongs_to :user


## chat_messages テーブル

| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| message      | string     |                                |
| user         | references | null: false, foreign_key: true |
| chat_room    | references | null: false, foreign_key: true |

### Association

- belongs_to :chat_room
- belongs_to :user


## reactions テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| from_user | string     | null: false |
| to_user   | string     | null: false |
| status    | string     | null: false |

### Association

- belongs_to :user
