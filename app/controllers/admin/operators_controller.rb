class Admin::OperatorsController < Admin::AdminController
  before_action :authorize_admin
  before_action :set_operator, only: [:edit, :update, :destroy]

  def index
    @operators = Operator.all.page(params[:page])
  end

  def new
    @operator = Operator.new
  end

  def create
    @operator = Operator.new(operator_params)

    if @operator.save
      redirect_to admin_operators_path, notice: 'Оператор создан.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @operator.update(operator_params)
      redirect_to admin_operators_path, notice: 'Оператор обновлён.'
    else
      render :edit
    end
  end

  def destroy
    @operator.destroy
    redirect_to admin_operators_path, notice: 'Оператор удалён.'
  end

  private

  def set_operator
    @operator = Operator.find(params[:id])
  end

  def operator_params
    params.require(:operator).permit(:name, :email, :password, :password_confirmation)
  end
end
