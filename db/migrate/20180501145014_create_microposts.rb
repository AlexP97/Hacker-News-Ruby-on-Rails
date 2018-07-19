class CreateMicroposts < ActiveRecord::Migration[5.1]
  def change
    create_table :microposts do |t|
      t.string :title
      t.string :url
      t.string :text
      t.string :user_name
      t.string :user_id
      t.integer :cached_votes_total, default: 0

      t.timestamps
    end
  end
end
