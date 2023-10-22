class AdminsController < ApplicationController

  def index
    authorize!("admin")
    @admins = User.includes(:roles).where('roles.name = ?','admin').references(:roles)
    render(json: @admins)
  end

  def show
    authorize!("admin")

    @admin = User.where('users.id =? ',params[:id]).includes(:roles).where('roles.name = ?', 'admin').references(:roles)
    render(json: @admin)
  end

  def create
    authorize!(:create)

    @post = Post.new(params.permit(:title, :content))
    @post.save
  end

  def update
    authorize!(:update)

    @post = Post.find(params[:id])
    @post.update(post_params)
  end

  def destroy
    authorize!(:destroy)

    @post = Post.find(params[:id])
    @post.destroy
  end

  private

  def admin_params
    params.permit(:email, :password, :jti, :age, :username)
  end
end
