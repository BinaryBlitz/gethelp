class Admin::StatisticsController < Admin::AdminController
  def index
    @statistics = date_range_present? ? Statistics.new(*date_range) : Statistics.new
  end

  private

  def date_range
    from = params[:from]
    to = params[:to]
    [from, to]
  end

  def date_range_present?
    params[:from].present? && params[:to].present?
  end
end
