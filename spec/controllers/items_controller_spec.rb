require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  let(:user) { create(:user) }

  context "when logged out" do
      it "returns an http redirect" do
        post :create, params: { user_id: user.id, item: { name: FFaker::Name } }
        expect(response).to redirect_to new_user_session_path
      end
    end

  context "when logged in" do

    before :each do
      sign_in(user)
    end

    describe "POST #create" do
      it "increases the number of items by 1" do
        expect { post :create, params: { user_id: user.id, item: { name: FFaker::Lorem.sentence } } }.to change(Item, :count).by(1)
      end

      it "assigns the new item to @item" do
        post :create, params: { user_id: user.id, item: { name: FFaker::Lorem.sentence } }
        expect(assigns(:item)).to eq Item.last
      end

      it "associates the logged in user with the new item" do
        post :create, params: { user_id: user.id, item: { name: FFaker::Lorem.sentence } }
        expect(Item.last.user_id).to eq user.id
      end

      it "redirects to the users show view" do
        post :create, params: { user_id: user.id, item: { name: FFaker::Lorem.sentence } }
        expect(response).to redirect_to users_show_path
      end
    end
  end
end
