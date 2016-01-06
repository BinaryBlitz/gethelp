class Statistics
  def initialize(from, to)
    @from = from
    @to = to
    @orders = Order.where(created_at: from..to)
  end

  def order_count
    @orders.count
  end

  def rejected_count
    @orders.with_status(:rejected).count
  end

  def refunded_count
    @orders.with_status(:refunded).count
  end

  def pending_count
    @orders.with_status(:pending).count
  end

  def total_refunded
    @orders.with_status(:refunded).sum(:sum)
  end

  def total_paid
    @orders.with_status(:paid).sum(:sum)
  end
end
