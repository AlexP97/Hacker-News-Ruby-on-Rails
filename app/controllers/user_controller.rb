class UserController < ApplicationController
    
    def show
      @user = User.find(params[:id])
      respond_to do |format|
        format.html { render :show }
        format.json { render json: @user }
      end
    end
    
    def edit
        set_user
    end
    def update
        set_user
        respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to "/me", notice: 'User was successfully updated.' }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
    end
  private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end
end