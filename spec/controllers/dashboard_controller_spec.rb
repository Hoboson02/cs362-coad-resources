require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  it "redirects to login when not signed in" do
    get :index
    expect(response).to redirect_to(new_user_session_path)
  end
end
