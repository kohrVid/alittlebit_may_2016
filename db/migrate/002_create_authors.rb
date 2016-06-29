class CreateAuthors < ActiveRecord::Migration
  def self.up
    create_table :authors do |t|
      t.string :title
      t.text :first_name
      t.text :middle_name
      t.text :last_name
      t.text :biography
      t.datetime :dob
      t.text :place_of_birth
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :authors
  end
end
