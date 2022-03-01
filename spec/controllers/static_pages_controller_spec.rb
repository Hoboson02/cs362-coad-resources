require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe 'user that is not signed in' do
    it 'does not redirect' do
      get :index
      expect(response.redirect?).to be(false)
    end
  end
end
