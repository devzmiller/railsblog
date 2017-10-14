require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "posts#index" do
    it 'returns ok status' do
      expect(last_response).to be_ok
    end
  end
end
