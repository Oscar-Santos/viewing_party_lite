class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @movies = @user.parties.map { |party| MoviesFacade.get_poster(party.movie_id) }
  end

  def new

  end

  def create
    # user = User.create(user_params)
    # redirect_to user_path(user.id)

    user = User.new(user_params)
    if user.save
      redirect_to user_path(user.id)
      flash[:success] = "Welcome, #{user.email}!"
    else
      redirect_to root_path
      flash[:error] = user.errors.full_messages
    end
  end

  def login

  end

  def login_user
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      redirect_to user_path(user.id)
      flash[:success] = "Welcome back, #{user.email}"
    else
      flash[:error] = 'Invalid Credentials'
      render :login
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end


end
