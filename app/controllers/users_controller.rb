class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Creat user was successfully.' }
        format.json { render json: @user, status: :created, location: @user}
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def new
    @user = User.new
  end
  def edit
    @user = User.find(params[:id])
  end
  def show
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update name: params[:user][:name], age: params[:user][:age]
      flash['alert'] = "update success"
      return redirect_to users_url
    else
      flash.now['alert'] = "update error"
      return render :edit
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :age, :email, :password, :password_comfirmation
  end
end
