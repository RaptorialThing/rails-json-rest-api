class UsersController < ApplicationController
	# before_action :authorized, only: [:auto_login]

	# #register
	# def create
	# 	@user = User.create(user_params)

	# 	if @user.valid?
	# 		token = encode_token({user_id: @user.id})
	# 		render json: {user: @user, token: @token}
	# 	else 
	# 		render json: {error: "Invalid username or password"}
	# 	end
	# end

	# #log in
	# def login
	# 	@user = User.find_by(username: params[:username])

	# 	if @user && @user.authenticate(params[:password])
	# 		token = encode_token({user_id: @user.id})
	# 		render json: {user: @user, token: token}
	# 	else 
	# 		render json: {error: "Invalid username or password"}
	# 	end
	# end

	# def auto_login
	# 	render json: @user
	# end

	# private

	# def user_params
	# 	params.permit(:username, :password, :age)
	# end
	before_action :authenticate_request

  def register
  	if User.exists?(email: params[:email])
  		render(json: {"error": "email already exists"}, status: "409")
  		return
  	end

    @user = User.create!(user_params)
    if @user.save
      render(json: { message: "User created successfully" }, status: :created)
    else
      render(json: @user.errors, status: :bad)
    end
  end


  def about
  	render json: {message: "ok", status: "200"}
  end

  private

  def user_params
    params.permit(:email, :password, :jti, :age, :username)
  end
end
