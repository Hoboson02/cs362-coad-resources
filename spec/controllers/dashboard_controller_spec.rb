require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  it "redirects to login when not signed in" do
    get :index
    expect(response).to be_redirect
    expect(response).to redirect_to("/users/sign_in")
  end
end
