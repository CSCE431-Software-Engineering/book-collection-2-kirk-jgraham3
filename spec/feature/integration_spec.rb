# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  before do
    visit new_book_path
  end

  it 'creates a book with valid title' do
    fill_in 'book[title]', with: 'harry potter'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end

  it 'creates a book with valid author' do
    fill_in 'book[title]', with: 'harry potter'
    fill_in 'book[author]', with: 'J.K. Rowling'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('J.K. Rowling')
  end

  it 'creates a book with valid price' do
    fill_in 'book[title]', with: 'harry potter'
    fill_in 'book[price]', with: 19.99
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('19.99')
  end

  it 'creates a book with valid published date' do
    fill_in 'book[title]', with: 'harry potter'
    select '1997', from: 'book_published_date_1i'
    select 'June', from: 'book_published_date_2i'
    select '26', from: 'book_published_date_3i'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('1997-06-26')
  end
end
