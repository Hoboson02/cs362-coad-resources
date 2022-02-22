require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do

  describe "user that is not signed in" do
    it "redirected to sign in" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
      get :show, params: {id: "FAKE"}
      expect(response).to redirect_to(new_user_session_path)
      get :new
      expect(response).to redirect_to(new_user_session_path)
      post :create
      expect(response).to redirect_to(new_user_session_path)
      get :edit, params: {id: "FAKE"}
      expect(response).to redirect_to(new_user_session_path)
      patch :update, params: {id: "FAKE"}
      expect(response).to redirect_to(new_user_session_path)
      put :update, params: {id: "FAKE"}
      expect(response).to redirect_to(new_user_session_path)
      patch :activate, params: {id: "FAKE"}
      expect(response).to redirect_to(new_user_session_path)
      patch :deactivate, params: {id: "FAKE"}
      expect(response).to redirect_to(new_user_session_path)
      delete :destroy, params: {id: "FAKE"}
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "organization user" do
    it "redirected to dashboard" do
      sign_in(create(:organization_user))
      get :index
      expect(response).to redirect_to(dashboard_path)
      get :show, params: {id: "FAKE"}
      expect(response).to redirect_to(dashboard_path)
      get :new
      expect(response).to redirect_to(dashboard_path)
      post :create
      expect(response).to redirect_to(dashboard_path)
      get :edit, params: {id: "FAKE"}
      expect(response).to redirect_to(dashboard_path)
      patch :update, params: {id: "FAKE"}
      expect(response).to redirect_to(dashboard_path)
      put :update, params: {id: "FAKE"}
      expect(response).to redirect_to(dashboard_path)
      patch :activate, params: {id: "FAKE"}
      expect(response).to redirect_to(dashboard_path)
      patch :deactivate, params: {id: "FAKE"}
      expect(response).to redirect_to(dashboard_path)
      delete :destroy, params: {id: "FAKE"}
      expect(response).to redirect_to(dashboard_path)
    end
  end
end
