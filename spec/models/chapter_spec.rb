require 'rails_helper'

describe Chapter do
  let(:chapter) { Chapter.new }
  subject { chapter }

  context 'title' do
    it { should respond_to(:title) }
    it 'validates presence of title' do
      chapter.valid?
      expect(chapter.errors).to have_key(:title)
    end
  end
end
