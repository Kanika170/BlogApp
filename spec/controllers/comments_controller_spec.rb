require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before do
    @user = User.create!(email: 'test@example.com', password: 'password')
    sign_in @user
    
    @post = Post.create!(title: 'Test Post', body: 'This is a test post.', user: @user)
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new comment' do
        expect {
          post :create, params: { post_id: @post.id, comment: { body: 'Test comment' } }
        }.to change(Comment, :count).by(1)
      end

      it 'redirects to the post page with a success message' do
        post :create, params: { post_id: @post.id, comment: { body: 'Test comment' } }
        expect(response).to redirect_to(@post)
        expect(flash[:notice]).to eq('Comment created successfully')
      end
    end

    context 'with invalid attributes' do
      it 'does not create a comment and renders the new template' do
        expect {
          post :create, params: { post_id: @post.id, comment: { body: '' } }
        }.not_to change(Comment, :count)
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      @comment = @post.comments.create!(body: 'This is a comment', user: @user)
    end

    it 'deletes the comment' do
      expect {
        delete :destroy, params: { post_id: @post.id, id: @comment.id }
      }.to change(Comment, :count).by(-1)
    end

    it 'redirects to the posts index with a success message' do
      delete :destroy, params: { post_id: @post.id, id: @comment.id }
      expect(response).to redirect_to(posts_url)
      expect(flash[:notice]).to eq('Comment deleted successfully')
    end
  end
end
