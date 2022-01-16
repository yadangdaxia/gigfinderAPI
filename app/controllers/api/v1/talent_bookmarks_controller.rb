class Api::V1::TalentBookmarksController < Api::V1::BaseController

  def create
    @talent_bookmark = TalentBookmark.find_by(user: current_user, talent_id: params[:user_id] )
    if @talent_bookmark.present?
      @talent_bookmark.destroy
      @user = @talent_bookmark.talent
      @bookmarked = false
    else

      @talent_bookmark = TalentBookmark.new
      @talent_bookmark.talent_id = params[:user_id]
      @talent_bookmark.user = current_user
      @talent_bookmark.save
      @user = @talent_bookmark.talent
      @bookmarked = true
    end

  end



  private

  # def bookmark_params
  #     params.require(:user).permit(:user_id, :talent_id)
  # end

end
