module Api
  module V1
    class UsersController < ApplicationController
      respond_to :json
      
      def new
        @user = User.new(user_params)
        if @user.save
          respond_with @user
        else
          respond_with nil
        end
      end

      def update
        if params[:user][:user_id]
          @user = User.find(params[:user][:user_id])
#          if params.has_key?(:food_notifications)
#            @user.food_notifications = params[:food_notifications]
#          end
#          if params.has_key?(:verify_reports)
#            @user.verify_reports = params[:verify_reports]
#          end   
#          if params.has_key?(:daily_reminders)
#            @user.daily_reminders = params[:daily_reminders]
#          end
          if @user.update_attributes(update_user_params)
            render json: @user
          else
            render json: nil
          end
        else
          render json: nil
        end
      end

      private
        def user_params
          params.require(:user).permit(:username, :email)
        end

        def update_user_params
          params.require(:user).permit(:verify_reports, :daily_reminders, :food_notifications)
        end
    end
  end
end
