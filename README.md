# テーブル設計

   users テーブル

| Column          | Type   | Options                        |
| nickname        | string | null: false                    |
| email           | string | null: false: foreign_key: true |
| password        | string | null: false: foreign_key: true |
| last_name       | string | null: false                    |
| first_name      | string | null: false                    |
| last_name_kana  | string | null: false                    |
| first_name_kana | string | null: false                    |
| birthday        | date   | null: false                    |

    Association
- has_many :items
- has_many :purchases

   items テーブル

| name             | string     | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| postage_payer_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| handling_time_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false: foreign_key: true |

    Association
- belongs_to :user
- belongs_to :category(active_hash)
- has_one :purchases
- belongs_to :category(active_hash)
- belongs_to :condition(active_hash)
- belongs_to :handling_time(active_hash)
- belongs_to :prefecture(active_hash)

   category(active_hash) テーブル

| category | string | null: false |

    Association
- has_many :items

   condition(active_hash) テーブル

| condition | string | null: false |

    Association
- has_many :items

   handling_time(active_hash) テーブル

| handling_time | string | null: false |

    Association
- has_many :items

   prefecture(active_hash) テーブル

| prefecture | string | null: false |

    Association
- has_many :items
- has_many :addresses

   purchases テーブル

| user | references | null: false: foreign_key: true |
| item | references | null: false: foreign_key: true |

   Association
- has_one :addresse


   addresses

| post_code      | string     | null: false                    |
| city           | string     | null: false                    |
| building_name  | string     | null: false: foreign_key: true |
| phone_number   | string     | null: false                    |
| prefectures_id | integer    | null: false: foreign_key: true |
| purchase       | references | null: false: foreign_key: true |

   Association
- belongs_to :prefecture(active_hash)
