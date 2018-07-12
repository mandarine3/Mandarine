class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :post_id #id 앞에는 모델 이름을 적어주자.
      #t.belongs_to :user
      #t.belongs_to :post
      t.timestamps null: false
    end
  end
end
