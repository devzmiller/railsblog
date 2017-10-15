require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.create!(name: "Marguerite Fish", email: "fish@llama.com", password: "ham")}

  describe 'validations' do
    context 'it is invalid when' do
      it 'does not have a name' do
        user.name = nil
        expect(user).to_not be_valid
      end
      it 'does not have an email' do
        user.email = nil
        expect(user).to_not be_valid
      end
      it 'has a non-unique email' do
        user2 = User.new(name: "Marguerite Fish", email: "fish@llama.com", password: "ham")
        expect(user2).to_not be_valid
      end
      it 'does not have a hashed_password' do
        user.hashed_password = nil
        expect(user).to_not be_valid
      end
    end
    context 'it is valid when' do
      it 'has a name, email, and hashed_password' do
        expect(user).to be_valid
      end
    end
  end

  describe 'authentication' do
    it 'has a hashed password' do
      expect(user.hashed_password).to_not eq "ham"
    end
    it 'returns the user when they correctly authenticate' do
      expect(User.authenticate("fish@llama.com", "ham")).to eq user
    end
    it 'returns nil when the user enters an email which does not exist in the database' do
      expect(User.authenticate("marvin@ham.com", "ham")).to be_nil
    end
    it 'returns nil when the password does not match' do
      expect(User.authenticate("fish@llama.com", "spam")).to be_nil
    end
  end
end
