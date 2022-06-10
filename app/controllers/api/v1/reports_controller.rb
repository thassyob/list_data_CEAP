class Api::V1::ReportsController < ApplicationController
  def create
    report = Report::ReportCreatorService.new(params).call

    render json: report,
           status: :created
  end
end