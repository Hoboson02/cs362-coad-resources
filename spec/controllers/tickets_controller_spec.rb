require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  describe 'user that is not signed in' do
    it 'redirected to dashboard' do
      delete :destroy, params: { id: 'FAKE' }
      expect(response).to redirect_to(dashboard_path)

      get :show, params: { id: 'FAKE' }
      expect(response).to redirect_to(dashboard_path)

      post :capture, params: { id: 'FAKE' }
      expect(response).to redirect_to(dashboard_path)

      post :release, params: { id: 'FAKE' }
      expect(response).to redirect_to(dashboard_path)

      patch :close, params: { id: 'FAKE' }
      expect(response).to redirect_to(dashboard_path)
    end
  end

  describe 'organization user' do
    it 'redirected to dashboard' do
      user = create(:organization_user)
      user.organization = create(:approved_organization)
      sign_in(user)

      delete :destroy, params: { id: 'FAKE' }
      expect(response).to redirect_to(dashboard_path)
    end

    it 'unapproved redirected to dashboard' do
      user = create(:organization_user)
      user.organization = create(:organization)
      sign_in(create(:organization_user))

      expect(user.organization).to_not be_approved

      get :show, params: { id: 'FAKE' }
      expect(response).to redirect_to(dashboard_path)

      post :capture, params: { id: 'FAKE' }
      expect(response).to redirect_to(dashboard_path)

      post :release, params: { id: 'FAKE' }
      expect(response).to redirect_to(dashboard_path)

      patch :close, params: { id: 'FAKE' }
      expect(response).to redirect_to(dashboard_path)

      delete :destroy, params: { id: 'FAKE' }
      expect(response).to redirect_to(dashboard_path)
    end
  end
end
