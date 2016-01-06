class Admin::StatisticsController < Admin::AdminController
  def index
    @statistics = Statistics.new(1.year.ago, Time.zone.now)
  end
end
