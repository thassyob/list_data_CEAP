require 'rails_helper'

RSpec.describe "Api::V1::Reports", type: :request do
  describe 'POST #create' do
    context 'when creating a report' do
      it 'return 201 status code' do
        user = create(:user)
        params = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/planilha_teste.xlsx'))
      
        post '/api/v1/reports', params: { file: params }, headers: get_headers(user)

        expect(response).to have_http_status(:created)
      end
    end
  end
end