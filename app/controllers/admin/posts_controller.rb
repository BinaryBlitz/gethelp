class Admin::PostsController < Admin::AdminController
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to admin_posts_path, notice: 'Новость создана'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to [:admin, @post], notice: 'Новость обновлена'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path, notice: 'Новость удалена'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params
      .require(:post)
      .permit(:title, :subtitle, :content, :image, :promo)
  end
end
