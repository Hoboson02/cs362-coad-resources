require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do
  describe 'user that is not signed in' do
    it 'redirected to sign in' do
      get :index
      expect(response).to redirect_to(new_user_session_path)
      post :index
      expect(response).to redirect_to(new_user_session_path)
      get :new
      expect(response).to redirect_to(new_user_session_path)
      post :create
      expect(response).to redirect_to(new_user_session_path)
      get :edit, params: { id: 'FAKE' }
      expect(response).to redirect_to(new_user_session_path)
      patch :update, params: { id: 'FAKE' }
      expect(response).to redirect_to(new_user_session_path)
      put :update, params: { id: 'FAKE' }
      expect(response).to redirect_to(new_user_session_path)
      get :show, params: { id: 'FAKE' }
      expect(response).to redirect_to(new_user_session_path)
      post :approve, params: { id: 'FAKE' }
      expect(response).to redirect_to(new_user_session_path)
      post :reject, params: { id: 'FAKE' }
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'approved organization user' do
    it 'redirected to dashboard' do
      user = create(:organization_user)
      user.organization = create(:approved_organization)
      sign_in(user)

      post :approve, params: { id: 'FAKE' }
      expect(response).to redirect_to(dashboard_path)
      post :reject, params: { id: 'FAKE' }
      expect(response).to redirect_to(dashboard_path)
    end
  end

  describe "unapproved organization user" do
    it 'redirected to dashboard' do
      user = create(:organization_user)
      user.organization = create(:organization)
      sign_in(user)

      expect(user.organization).to_not be_approved

      get :edit, params: { id: 'FAKE' }
      expect(response).to redirect_to(dashboard_path)
      patch :update, params: { id: 'FAKE' }
      expect(response).to redirect_to(dashboard_path)
      put :update, params: { id: 'FAKE' }
      expect(response).to redirect_to(dashboard_path)
      get :show, params: { id: 'FAKE' }
      expect(response).to redirect_to(dashboard_path)
    end
  end
end
