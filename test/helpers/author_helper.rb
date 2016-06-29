module AuthorHelper
  def self.author
    Author.new(
      first_name: "Albert",
      middle_name: "",
      last_name: "Einstein",
      biography: "Albert Einstein was a German-born theoretical physicist."
    )
  end

  def self.mononym
    Author.new(
      first_name: "", 
      middle_name: "", 
      last_name: "Plato", 
      biography: "Plato was a student of Socrates and teacher of Aristotle"
    )
  end

  def self.middle_name
    Author.new(
      first_name: "George",
      middle_name: "R. R.",
      last_name: "Martin",
      biography: "George Raymond Richard Martin often referred to as GRRM, is an American novelist and short-story writer in the fantasy, horror, and science fiction genres"
    )
  end
end
