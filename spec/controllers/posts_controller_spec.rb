require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "posts#index" do
    it 'returns ok status' do
      get :index
      expect(response).to be_ok
    end
  end
  describe 'posts#show' do
    xit 'returns ok status' do
      post = Post.create(title: "Sandwich", body: "Ham and cheese", user_id: 1)
      get :show, id: post
      expect(response).to be_ok
    end
  end
  describe 'posts#new' do
    xit 'returns ok status' do
      get :new
      expect(response).to be_ok
    end
  end
  # describe 'posts#create' do
  #   context 'user is logged in' do
  #     context 'post is valid' do
  #       before(:each) do
  #         post :create, {post: {title: "Sandwich", body: "Ham and cheese"}}, "rack.session" => {user_id: 1}
  #       end
  #       it 'creates a new post' do
  #         expect(Post.find_by_title("Sandwich")).to be_a Post
  #       end
  #       it 'redirects to #show' do
  #         post = Post.find_by_title("Sandwich")
  #         expect(response).to redirect_to post_path(post)
  #       end
  #     end
  #     context 'post is invalid' do
  #       it 'returns OK status'
  #       it 'has @errors'
  #       it 'renders #new view'
  #     end
  #   end
  #   context 'user is not logged in' do
  #     it 'redirects to sessions#new'
  #   end
  # end
end
