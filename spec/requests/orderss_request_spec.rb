require 'rails_helper'

RSpec.describe 'Ordersses', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/orderss/index'
      expect(response).to have_http_status(:success)
    end
  end
end
