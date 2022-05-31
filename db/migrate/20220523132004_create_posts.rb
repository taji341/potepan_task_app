class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.boolean :all_day
      t.string :post_memo
      t.timestamps
    end
  end
end
