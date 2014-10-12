module Api
  module V1
    class UsersController < ApplicationController
      respond_to :json
      
      def new
        @user = User.new(user_params)
        if @user.save
          respond_with @user
        end
      end
    
      private

        def user_params
          params.require(:user).permit(:username)
        end
    end
  end
end