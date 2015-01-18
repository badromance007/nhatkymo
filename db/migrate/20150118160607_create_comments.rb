class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :diary, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :diaries
    add_foreign_key :comments, :users
  end
end
