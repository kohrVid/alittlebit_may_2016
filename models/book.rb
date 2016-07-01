class Book < ActiveRecord::Base
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres

  validates :title, presence: true
  validates :isbn, presence: true
  validates :synopsis, presence: true, length: { minimum: 10 }, uniqueness: true
  validates :published_on, presence: true
  validates_presence_of :authors, :genres


end
