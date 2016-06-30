require "./test/helpers/author_helper"
module BookHelper
  @author = Author.find_or_create_by(AuthorHelper.author.attributes.reject{ |k, v| v.nil? })
  def self.book
    { 
      title: "A Little Bit of Knowledge",
      isbn: "978-1-93775571-0-2",
      synopsis: "Weakness of attitude becomes weakness of character...",
      published_on: Time.now,
      authors: [@author]
    }
  end

  def self.other_book
    {
      title: "A Little Bit of KnowHow",
      isbn: "978-1-93775571-0-1",
      synopsis: "Oh, that's not necessary. It's so seldom I  have one.",
      published_on: (Time.now-1.day),
      authors: [@author]
    }
  end
end

