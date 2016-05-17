require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  it_behaves_like "api_controller"

  let(:valid_attributes) {
    { username: "ajones", description: "Great Work!!!", rating: 5, timestamp: '2016-05-16T12:00:35' }
  }

  let(:invalid_attributes) {
    { username: "ajones", description: nil, rating: 5, timestamp: '2016-05-16T12:00:35' }
  }

  let!(:comment) { Comment.create(valid_attributes) }

  describe "GET #index" do
    it "assigns all comments as @comments" do
      get :index, { format: :json }
      expect(assigns(:comments)).to eq([comment])
    end
  end

  describe "GET #show" do
    it "assigns the requested comment as @comment" do
      get :show, { id: comment.id, format: :json }
      expect(assigns(:comment)).to eq(comment)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, { comment: valid_attributes, format: :json }
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, { comment: valid_attributes, format: :json }
        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved comment as @comment" do
          post :create, { comment: invalid_attributes, format: :json }
          expect(assigns(:comment)).to be_a_new(Comment)
      end

      it "returns unprocessable_entity status" do
        put :create, { comment: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { username: "aaron.jones", description: "Terrible, how could you let this out into the world", rating: 1, timestamp: '2016-05-16T12:00:35' }
      }

      it "updates the requested comment" do
        put :update, { id: comment.id, comment: new_attributes, format: :json  }
        comment.reload
        expect(comment.username).to eq("aaron.jones")
        expect(comment.description).to eq("Terrible, how could you let this out into the world")
        expect(comment.rating).to eq(1)
      end

      it "assigns the requested comment as @comment" do
        put :update, { id: comment.id, comment: valid_attributes, format: :json  }
        expect(assigns(:comment)).to eq(comment)
      end
    end

    context "with invalid params" do
      it "assigns the comment as @comment" do
        put :update, { id: comment.id, comment: invalid_attributes, format: :json  }
        expect(assigns(:comment)).to eq(comment)
      end

      it "returns unprocessable_entity status" do
        put :update, { id: comment.id, comment: invalid_attributes, format: :json }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested comment" do
      expect {
        delete :destroy, { id: comment.id, format: :json  }
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the comments list" do
      delete :destroy, { id: comment.id, format: :json  }
      expect(response.status).to eq(204)
    end
  end

end
