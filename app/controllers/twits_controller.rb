class TwitsController < ApplicationController
    def show
        @user = User.find(params[:id])
        @twit = Twit.find(params[:id])
    end

    def create
        @twit = current_user.twits.new(twits_params)
        @twit.save
        respond_to do |format|
          format.html { redirect_to user_twits_path }
          format.json { }
        end

    end

    def edit
        @twit = Twit.find(params[:id])
    end

    def update
      @twit = Twit.find(params[:id])
      @twit.update(twits_params)
      redirect_to user_twits_path
    end

    def destroy
      @twit = Twit.find(params[:id])
      @twit.destroy
      redirect_to user_twits_path
    end

    def user_twits
        @twits = current_user.twits.all
        @twit = current_user.twits.new
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
