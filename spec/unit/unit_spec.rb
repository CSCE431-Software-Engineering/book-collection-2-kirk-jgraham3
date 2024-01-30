# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    described_class.new(
      title: 'Harry Potter',
      author: 'J.K. Rowling',
      price: 19.99,
      published_date: Date.new(2001, 6, 26)
    )
  end
  
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  
  # Rainy-day scenario (no title)
  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  # Rainy-day scenario (no author)
  it 'is not valid without an author' do
    subject.author = nil
    expect(subject).not_to be_valid
  end

  # Rainy-day scenario (no price)
  it 'is not valid without a price' do
    subject.price = nil
    expect(subject).not_to be_valid
  end

  # Rainy-day scenario (no published_date)
  it 'is not valid without a published_date' do
    subject.published_date = nil
    expect(subject).not_to be_valid
  end
end
