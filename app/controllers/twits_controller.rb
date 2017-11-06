class TwitsController < ApplicationController
    def show
        @user = User.find(params[:id])
        @twit = Twit.find(params[:id])
    end
    
    def create
        @twit = current_user.twits.new(twits_params)
        @twit.save
        redirect_to user_twits_path
    end
    
    def user_twits
        @twits = current_user.twits.all
    end
    
    def hashtags
        tag = Tag.find_by(message_tag: params[:name])
        @twits = tag.twits
    end
    
    private
    
    def twits_params
        params.require(:twit).permit(:message, :user_id)
    end
end
