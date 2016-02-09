class Admin::StatisticsController < Admin::AdminController
  before_action :authorize_admin

  def index
    @statistics = Statistics.new(*date_range, operator)
  end

  private

  def operator
    Operator.find_by(id: params[:operator_id])
  end

  def date_range
    from = params[:from]
    to = params[:to]
    [from, to]
  end

  def date_range_present?
    params[:from].present? && params[:to].present?
  end
end
