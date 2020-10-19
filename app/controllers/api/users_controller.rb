module Api
  class UsersController < ActionController::Base
    def index
      @users = User.all

      render json: {
        success: true,
        data: @users.as_json(only: [:id, :name])
      }
    end
    def create
      @user = User.new(user_params)
      respond_to do |format|
        if @user.save
          render json: {success: true, data: @user}
        else
          render json: {success: false, data: @user.errors}
        end
      end
    end

    def show
      @user = User.find(params[:id])
      render json: { success: tr ue, data: @user.as_json(only: [:id, :name])}
    end

    def update
      @user = User.find(params[:id])
      if @user.update name: params[:user][:name], age: params[:user][:age]
        render json: { success: true, data: @user}
      else
        render json: {success: false, data: @user.errors}
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      render json: { success: true }
    end

    private
    def user_params
      params.require(:user).permit :name, :age, :email, :password, :password_comfirmation
    end
  end
end
