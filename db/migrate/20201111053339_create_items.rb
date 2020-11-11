class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|


      t.timestamps
    end
  end
end
name             | string     | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| postage_payer_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| handling_time_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false: foreign_key: true |