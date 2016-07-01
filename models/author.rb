class Author < ActiveRecord::Base
  has_many :author_books, dependent: :destroy
  has_many :books, through: :author_books, foreign_key: :book_id
  accepts_nested_attributes_for :books, allow_destroy: true, reject_if: :all_blank
  mount_uploader :image_url, ImageUploader

  validates :title, length: { maximum: 10 }
  validates :biography, presence: true, length: { minimum: 10 }, uniqueness: true
  validate :presence_of_name

  def full_name
    names = []
    [self.first_name, self.middle_name, self.last_name].each do |name|
      if name.present?
	names << name
      end
    end
    names.join(" ")
  end
  
  def first_name_last_name
    "#{self.first_name} #{self.last_name}"
  end
  

  private
    def presence_of_name
      if !self.full_name.present?
	[:first_name, :middle_name, :last_name].each do |col|
	  self.errors.add(col, "Author must have at least one name")
	end
      end
    end
end
