class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name, :email))
    if @user.save
      flash[:notice] = ['User successfully created']
      redirect_to "/users/#{User.last.id}"
    else
      #errors we need to code later
      flash[:notice] = @user.errors.full_messages
      redirect_to "/users/new"
    end
  end

  def show
    @user = User.last
    render 'show.html.erb'
  end 
end
