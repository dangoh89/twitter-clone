class UsersController < ApplicationController
 
    def user_dashboard
        @twit = current_user.twits.new
    end
    
    def search
        @friendships = current_user.followers
        @users = User.search(params[:search_param])
        
        if @users
            @users = current_user.except_current_user(@users)
            render "search"
        else
            render status: :not_found, nothing: true
        end
    end
    
    def my_followers
        @friendships = current_user.followers
    end
    
    def add_follower
        @follower = User.find(params[:follower])
        current_user.friendships.build(follower_id: @follower.id)
        if current_user.save
        redirect_to user_path(@follower.id), notice: "Friend was successfully added"
        else
        redirect_to user_path(@follower.id), flash[:error] = "There was an error with adding user as friend"
        end
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    private
    
    def users_params
        params.require(:user).permit(:username, :email)
    end
    
end
