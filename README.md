# テーブル設計

   users テーブル

| Column            | Type   | Options                        |
| nickname          | string | null: false                    |
| email             | string | null: false:                   |
|encrypted_password |string  | null: false:                   |
| last_name         | string | null: false                    |
| first_name        | string | null: false                    |
| last_name_kana    | string | null: false                    |
| first_name_kana   | string | null: false                    |
| birthday          | date   | null: false                    |

    Association
- has_many :items
- has_many :purchases

   items テーブル

| Column           | Type       | Options                        |
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
- has_one :purchase

   purchases テーブル

| Column | Type       | Options                        |
| user   | references | null: false: foreign_key: true |
| item   | references | null: false: foreign_key: true |

   Association
- has_one :address
- belongs_to :user
- belongs_to :item


   addresses
| Column         | Type       | Options                        |
| post_code      | string     | null: false                    |
| city           | string     | null: false              　　　 |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| prefecture_id  | integer    | null: false: foreign_key: true |
| purchase       | references | null: false: foreign_key: true |

   Association
- belongs_to :purchase