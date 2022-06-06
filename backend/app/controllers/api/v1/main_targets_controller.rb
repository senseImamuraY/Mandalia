module Api
  module V1
    class MainTargetsController < ApplicationController
      def index
        user = User.find(params[:user_id])
        main_target = user.main_targets

        render json: main_target
      end

      def show
        user = User.find(params[:user_id])
        main_target = user.main_targets.find(params[:id])
        render json: main_target
      end

      def create
        user = User.find(params[:user_id])
        main_target = user.main_targets.create!(main_target_params)

        if main_target.save
          render json: main_target
        else
          render json: main_target.errors, status: 422
        end
      end

      def update
        user = User.find(params[:user_id])
        main_target = user.main_target(params[:id])

        if main_target.update
          render json: main_target
        else 
          render json: main_target.errors, status: 422
        end
      end

      def destroy
        user = User.find(params[:user_id])
        main_target = user.main_targets.find(params[:id])
        if main_target.destroy
          head :no_content
        else 
          render json: {error: "Failed to destroy"}, status: 422
        end
      end

      private
        def main_target_params
          params.require(:main_target).permit(:target_main, :target_n, :target_ne, :target_e, :target_se, :target_s, :target_sw, :target_w, :target_nw)
        end
      
    end
  end
end

# def show
#   render json: 
#     User.find(params[:id])
# end

# def create 
#   user = User.new(user_params)
#   if user.save
#     render json: user
#   else
#     render json: user.errors, status: 422
#   end
# end

# def update 
#   user = User.find(params[:id])
#   if user.update
#     render json: user
#   else
#     render json: user.errors, status: 422
#   end
# end

# def destroy
#   if User.destroy(params[:id])
#     head :no_content
#   else
#     render json: {error: "Failed to destroy" }, status: 422
#   end
# end

# private
#   def user_params
#     params.require(:user).permit(:name, :email, :password, :password_confirmation)
#   end
# end
# end