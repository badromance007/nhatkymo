class AddSlugToDiaries < ActiveRecord::Migration
  def change
    add_column :diaries, :slug, :string
  end
end
