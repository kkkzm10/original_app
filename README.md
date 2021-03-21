# Mate
## 学生が日頃の学びをアウトプットして学びを定着させることを目的としたアプリケーション
時代の急速な変化に合わせて学校での学びも大きく変化しつつある昨今。しかしながら実際の学校現場では現在においても、先生が黒板やホワイトボードに文字を書き、学生がそれをノートに写しつつひたすら聴衆として授業を「聴く」スタイルが主流のようです。新しく得た情報を自らの頭で考え知識として定着させることが本来の学習の意義だとするならば、ただ椅子に座って人の話を長々と聞いているスタイルはあまりに非効率的なものだと言わざるをえません。
そこでこのアプリケーションの作成にあたっては、アウトプットを通じて特に10代の学生が効率よく学習内容を定着させるとともに、学校以外でも新たな交流ができるよう以下の3点を意識して作りました。
・ チャットやビデオ通話を使って互いに学ぶ内容のアウトプットができる
学校での学びが基本的に「聴く」学びである以上、自分で考えて人に話したり文章としてアウトプットする学習は恒常的に不足していると考えました。なのでこのアプリケーションを通じて他者にビデオ通話で話したり、チャットで書くという形で学びを知識として定着させてほしいと考えています。
・ 自己紹介を通じて、事前に互いの人柄や興味、学習への熱量などを知ることが出来る
アプリケーションを使うにあたっては、事前に自己紹介で自分がどんなことを学んでいるのかを他者に知ってもらう必要があります。通常のSNSとは異なり、学習アウトプットに特化したサービスですので、本気で学びを形にしたいと考えるユーザーに使ってもらえればと考えています。
・ 世界中の学生同士が交流できるよう、アプリ内の言語は基本的に英語で
10代の学生は、基本的に「学校」というある種の閉鎖的な環境を中心に日々の生活を営んでおり、時代が急速に変化する現代においても、自分が所属する学校というコミュニティー以外で世界との接点は殆どないのが現状です。このアプリケーションを通じて、自分が属するコミュニティー以外に生きる同世代との交流を図りながら多様な視野や価値観を知り、それらを受容するきっかけになってもらえればと思います。


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
