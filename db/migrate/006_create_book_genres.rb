class CreateBookGenres < ActiveRecord::Migration
  def self.up
    create_table :book_genres do |t|
      t.references :book, foreign_key: true, index: true
      t.references :genre, foreign_key: true, index: true
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :book_genres
  end
end
