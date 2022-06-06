module Api
  module V1
    class UsersController < ApplicationController

      def show
        render json: 
          User.find(params[:id])
      end

      def create 
        user = User.new(user_params)
        if user.save
          render json: user
        else
          render json: user.errors, status: 422
        end
      end

      def update 
        user = User.find(params[:id])
        if user.update
          render json: user
        else
          render json: user.errors, status: 422
        end
      end

      def destroy
        if User.destroy(params[:id])
          head :no_content
        else
          render json: {error: "Failed to destroy" }, status: 422
        end
      end

      private
        def user_params
          params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
    end
  end
end