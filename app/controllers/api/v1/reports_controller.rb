class Api::V1::ReportsController < ApplicationController
  def index
    reports = Report.where(sguf: "AL")

    reports = Report.where(sguf: params[:sguf]) if params[:sguf].present?

    render json: reports,
           each_serializer: Api::V1::Reports::Index::ReportSerializer,
           status: :ok
  end

  def create
    report = Report::ReportCreatorService.new(params).call

    render json: report,
           status: :created
  end
end