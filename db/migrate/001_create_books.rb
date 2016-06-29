class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.text :synopsis
      t.date :published_on
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :books
  end
end
