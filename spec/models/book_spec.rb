require 'rails_helper'

describe Book do
  let(:book){ Book.new }
  subject { book }

  context ':title' do
    it { should respond_to(:title) }
    it 'validates presence of title' do
      book.valid?
      expect(book.errors).to have_key(:title)
    end

    it 'length between 3 and 256 characters'
    it 'should start with letter'
  end

  context ':book_code' do
    it { should respond_to(:book_code) }

    it 'validates presence of book_code' do
      book.valid?
      expect(book.errors).to have_key(:book_code)
    end

    it 'length between 3 and 80 characters'
    it 'is case-insensitive and unique'

  end

  context ':description' do
    it { should respond_to(:description) }

    it 'is valid without description' do
      book = Book.new(title: 'hello', book_code: 'testcode', description: nil)
      expect(book).to be_valid
    end

    it 'allows maximum of 500 characters'
  end





end
