require 'rails_helper'

RSpec.describe "Api::V1::Reports", type: :request do
  describe 'INDEX #reports' do
    it 'must return 200 http status code and attributes' do
      user = create(:user)
      create(:report, sguf: "AL", document_value: 2000)
      create(:report, sguf: "AL", document_value: 8000)
      create(:report, sguf: "PE", document_value: 18000)
    
      get '/api/v1/reports', headers: get_headers(user)

      expect(response).to have_http_status(:ok)

      expect(json_body[0]).to have_key(:id)
      expect(json_body[0]).to have_key(:total_spent)
      expect(json_body[0]).to have_key(:expenses)
      expect(json_body[0]).to have_key(:higher_expense)
      expect(json_body[0][:expenses]).to have_key(:issuance_string)
      expect(json_body[0][:expenses]).to have_key(:supplier_text)
      expect(json_body[0][:expenses]).to have_key(:net_value)
      expect(json_body[0][:expenses]).to have_key(:url_document)
    end

    context 'when list report searching by sguf' do
      it do
        user = create(:user)
        create_list(:report, 3, sguf: "AL")
        create_list(:report, 2, sguf: "PE")
        query_params = 'PE'

        get "/api/v1/reports?sguf=#{query_params}", headers: get_headers(user)
        
        expect(json_body.count).to eq(2)
      end
    end
  end

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