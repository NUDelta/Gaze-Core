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
    
      private
        def user_params
          params.require(:user).permit(:username, :email)
        end
    end
  end
end
