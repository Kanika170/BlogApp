require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }
  let(:post_params) { { post: { title: 'Test Post', body: 'Test Content' } } }
  let!(:post) { Post.create(title: 'Post1', body: 'content for post1', user: user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: post.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
	    it 'creates a new post' do
	      expect {
	        process :create, method: :post, params: post_params
	      }.to change(Post, :count).by(1)
	    end
	  end

    context 'with invalid params' do
      it 'does not create a new post' do
        expect {
          process :create, method: :post, params: { post: { title: '', body: '' } }
        }.not_to change(Post, :count)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      it 'updates the post' do
        patch :update, params: { id: post.id, post: { title: 'updated title' } }
        post.reload
        expect(post.title).to eq('updated title')
        expect(response).to redirect_to(post)
      end
    end

    context 'with invalid params' do
      it 'does not update the post' do
        patch :update, params: { id: post.id, post: { title: '', body: '' } }
        post.reload
        expect(post.title).not_to eq('')
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the post' do
      expect {
        delete :destroy, params: { id: post.id }
      }.to change(Post, :count).by(-1)
      expect(response).to redirect_to(posts_url)
    end
  end
end
