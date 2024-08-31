class UsersController < ApplicationController
  # before_action :authenticate_user!
  def index
    puts "==================="
    puts "index"
    puts "==================="
    @users = User.all
  end
  def show
    @user = User.find(params[:id])

    # if @user == current_user
    #   # ログイン中のユーザーに対する処理
    # else
    #   # 他のユーザーに対する処理
    # end
    puts "==================="
    puts  @user
    puts  @user.name
    puts "==================="
  end

def new
  @user = User.new
end

def create
  puts "==================="
  puts "create"
  puts "==================="
  @user = User.new(user_params)
  if @user.save
    reset_session
    log_in @user
    flash[:success] = "Welcome to the Sample App!"
    redirect_to @user
  else
    render 'new', status: :unprocessable_entity
  end
end

def edit
  puts "==================="
  puts "edit"
  puts "==================="
  @user = User.find(params[:id])
end
def update
  puts "==================="
  puts "update"
  puts "==================="
  @user = User.find(params[:id])

  if @user.update(user_params)
    redirect_to @user
  else
    render :edit, status: :unprocessable_entity
  end
end
def destroy
  puts "==================="
  puts "destroy"
  puts "==================="
  @user = User.find(params[:id])
  @user.destroy

  redirect_to root_path, status: :see_other
end
private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
