class Web::OrdersController < Web::WebController
  before_action :set_due_by, only: [:create]

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.due_by = @due_by

    if @order.save
      redirect_to new_web_order_path, notice: 'Спасибо, за вашу заявку, в ближайшее время мы свяжемся с вами.'
    else
      render :new
    end
  end

  private

  def order_params
    params
      .require(:order)
      .permit(
        :name, :phone_number, :course, :category, :grade, :due_by_time, :due_by_date,
        :faculty, :university, :email, :site, :description, :from_web, :dye_by
      )
  end

  def set_due_by
    @due_by = Order.date_with_time(order_params[:due_by_date].to_date, order_params[:due_by_time].to_time)
  end
end
