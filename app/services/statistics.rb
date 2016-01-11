class Statistics
  def initialize(from = nil, to = nil, operator = nil)
    @orders = Order.all
    @orders = @orders.where(created_at: from..to) if from && to
    @orders = @orders.where(operator: operator) if operator
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
