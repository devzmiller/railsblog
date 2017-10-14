require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it 'is invalid without a body' do
      post = Post.new(title: "Sandwiches")
      expect(post).to_not be_valid
    end
  end
end
