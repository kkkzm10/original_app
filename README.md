# Mate
## 学生が日頃の学びをアウトプットして学びを定着させることを目的としたアプリケーション
時代の急速な変化に合わせて学校での学びも大きく変化しつつある昨今。しかしながら実際の学校現場では現在においても、先生が黒板やホワイトボードに書き、学生がそれをノートに写しつつひたすら聴衆として授業を「聴く」スタイルが主流のようです。新しく得た情報を自らの頭で考えて知識として定着させることが本来の学習の意義だとするならば、ただ椅子に座って人の話を長々と聞いているスタイルはあまりに非効率的なものだと言わざるをえません。
そこでこのアプリケーションの作成にあたっては、特に10代の学生が効率よく学習内容を定着させられるよう以下の2点を意識して作りました。
・ 
・ 




# DB設計

## users テーブル

| Column                 | Type   | Options     |
| --------               | ------ | ----------- |
| last_name              | string | null: false |
| first_name             | string | null: false |
| email                  | string | null: false, unique: true|
| encrypted_password     | string | null: false |
| self_introduction      | string | null: false |

### Association

- has_many :chat_room_users
- has_many :chat_rooms, through: chat_room_users
- has_many :chat_messages
- has_many :relationships


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


## relationships テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| from_user | string     | null: false |
| to_user   | string     | null: false |
| status    | string     | null: false |

### Association

- belongs_to :user
