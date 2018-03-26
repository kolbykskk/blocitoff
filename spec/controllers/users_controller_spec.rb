require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  context "when logged in" do

    before :each do
      sign_in(user)
    end

    describe "GET #show" do
      it "returns http success" do
        get :show, params: { id: user.id }
        expect(response).to have_http_status(:success)
      end

      it "renders the show view" do
        get :show, params: { id: user.id }
        expect(response).to render_template(:show)
      end

      it "assigns the logged in user to @user" do
        get :show, params: { id: user.id }
        expect(assigns(:user)).to eq(user)
      end
    end
  end

  context "when logged out" do
    describe "GET #show" do
      it "returns http redirect" do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end
