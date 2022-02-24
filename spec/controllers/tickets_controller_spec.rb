require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  describe "user that is not signed in" do
    it "redirected to sign in" do
      delete :destroy, params: {id: "FAKE"}
      expect(response).to redirect_to(dashboard_path)
    end
  end

  describe "organization user" do
    it "redirected to dashboard" do
      sign_in(create(:organization_user))
      delete :destroy, params: {id: "FAKE"}
      expect(response).to redirect_to(dashboard_path)
    end
  end
end
