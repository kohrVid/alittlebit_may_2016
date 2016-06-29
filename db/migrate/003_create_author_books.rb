class CreateAuthorBooks < ActiveRecord::Migration
  def self.up
    create_table :author_books do |t|
      t.references :author, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :author_books
  end
end
