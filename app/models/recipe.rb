class Recipe < ActiveRecord::Base
  has_many :ingredients
  belongs_to :book
  # accepts_nested_attributes_for :ingredients

  def ingredients_attributes=(ingredients_attributes)
    #binding.pry
    #raise attributes.inspect
    ingredients_attributes.each do |i, attributes|
      self.ingredients.build(attributes)
    end
  end

  def book_attributes=(book_attributes)
    self.book = Book.where(name: book_attributes[:name]).first_or_create do |b|
      b.author = book_attributes[:author]
    end
  end

  # def book_name(name)
  #   self.book = Book.find_by(name: name)
  # end
  #
  # def new_book_attributes(book_attributes)
  #   self.book.build(book_attributes)
  # end
end
