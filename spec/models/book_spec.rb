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
  end

  context ':book_code' do
    it { should respond_to(:title) }

    it 'validates presence of book_code' do
      book.valid?
      expect(book.errors).to have_key(:book_code)
    end
  end

  context ':description' do
    it { should respond_to(:description) }

    it 'is valid without description' do
      book = Book.new(title: 'hello', book_code: 'testcode', description: nil)
      expect(book).to be_valid
    end
  end





end
