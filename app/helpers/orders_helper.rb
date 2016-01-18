module OrdersHelper
  def class_for_status(status)
    case status
    when 'new' then 'label-primary'
    when 'pending' then 'label-warning'
    when 'paid' then 'label-success'
    when 'rejected', 'refunded' then 'label-danger'
    else 'label-default'
    end
  end
end
