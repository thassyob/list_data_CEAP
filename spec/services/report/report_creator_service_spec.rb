require 'rails_helper'

RSpec.describe Report::ReportCreatorService, type: :service do
  describe '#call' do
    it 'must create reports' do
      file = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/planilha_teste.xlsx'))
      params = { file: file }

      reports = Report::ReportCreatorService.new(params).call

      expect(reports.count).to eq 4
    end
  end
end