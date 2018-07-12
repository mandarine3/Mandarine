class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :content
      t.integer :post_id      #요즘 방식 t.belongs_to
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
