module Api
  module V1
    class SubTargetsController < ApplicationController
      def index
        user = User.find(params[:user_id])
        main_target = user.main_targets.find(params[:main_target_id])
        sub_target = main_target.sub_targets
        render json: sub_target
      end

      def show
        user = User.find(params[:user_id])
        main_target = user.main_targets.find(params[:main_target_id])
        sub_target = main_target.sub_targets.find(params[:id])
        render json: main_target
      end

      def create
        user = User.find(params[:user_id])
        main_target = user.main_targets.find(params[:main_target_id])
        sub_target = main_target.sub_targets.create!(sub_target_params)

        if sub_target.save
          render json: sub_target
        else
          render json: sub_target.errors, status: 422
        end
      end

      def update
        user = User.find(params[:user_id])
        main_target = user.main_target(params[:main_target_id])
        sub_target = main_target.sub_targets(params[:id])

        if main_target.update
          render json: sub_target
        else 
          render json: sub_target.errors, status: 422
        end
      end

      def destroy
        user = User.find(params[:user_id])
        main_target = user.main_targets.find(params[:main_target_id])
        sub_target = main_target.sub_targets.find(params[:id])
        if sub_target.destroy
          head :no_content
        else 
          render json: {error: "Failed to destroy"}, status: 422
        end
      end

      private
        def sub_target_params
          params.require(:sub_target).permit(:sub_target_main, :sub_target_n, :sub_target_ne, :sub_target_e, :sub_target_se, :sub_target_s, :sub_target_sw, :sub_target_w, :sub_target_nw)
        end
    end
  end
end
