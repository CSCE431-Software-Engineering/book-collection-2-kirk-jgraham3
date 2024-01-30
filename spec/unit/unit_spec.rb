# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    described_class.new(
      title: 'harry potter',
      author: 'J.K. Rowling',
      price: 19.99,
      published_date: Date.new(1997, 6, 26)
    )
  end
  
  # Rainy-day scenario (no title)
  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid with a negative price' do
    subject.price = -20.0
    expect(subject).not_to be_valid
  end

  it 'can set and get author' do
    book = Book.new(author: "J. K. Rowling")
    assert_equal "J. K. Rowling", book.author
  end

  it 'can set and get published date' do
    book = Book.new(published_date: "1997-06-26")
    assert_equal "1997-06-26", book.published_date.strftime('%Y-%m-%d')
  end
end
