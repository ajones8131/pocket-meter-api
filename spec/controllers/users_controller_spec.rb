#spec/controllers/users_controller_spec.rb

require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  it_behaves_like "api_controller"

  let(:valid_attributes) {
    { username: "ajones" }
  }

  let(:invalid_attributes) {
    { username: nil }
  }

  let!(:user) { User.create(valid_attributes) }

  describe "GET #index" do
    it "assigns all users as @users" do
      get :index, { format: :json }
      expect(assigns(:users)).to eq([user])
    end
  end

  describe "GET #show" do
    it "assigns the requested user as @user" do
      get :show, { id: user.id, format: :json }
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, { user: valid_attributes, format: :json }
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, { user: valid_attributes, format: :json }
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
          post :create, { user: invalid_attributes, format: :json }
          expect(assigns(:user)).to be_a_new(User)
      end

      it "returns unprocessable_entity status" do
        put :create, { user: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { username: "aaron.jones" }
      }

      it "updates the requested user" do
        put :update, { id: user.id, user: new_attributes, format: :json  }
        user.reload
        expect(user.username).to eq("aaron.jones")
      end

      it "assigns the requested user as @user" do
        put :update, { id: user.id, user: valid_attributes, format: :json  }
        expect(assigns(:user)).to eq(user)
      end
    end

    context "with invalid params" do
      it "assigns the user as @user" do
        put :update, { id: user.id, user: invalid_attributes, format: :json  }
        expect(assigns(:user)).to eq(user)
      end

      it "returns unprocessable_entity status" do
        put :update, { id: user.id, user: invalid_attributes, format: :json }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      expect {
        delete :destroy, { id: user.id, format: :json  }
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      delete :destroy, { id: user.id, format: :json  }
      expect(response.status).to eq(204)
    end
  end
end
