class Api::V1::GigBookmarksController < Api::V1::BaseController
  def create
    @gig_bookmark = GigBookmark.find_by(user: current_user, gig_id: params[:gig_id] )
    if @gig_bookmark.present?
      @gig_bookmark.destroy
      @gig = @gig_bookmark.gig
      @bookmarked = false
    else

      @gig_bookmark = GigBookmark.new
      @gig_bookmark.gig_id = params[:gig_id]
      @gig_bookmark.user = current_user
      @gig_bookmark.save
      @gig = @gig_bookmark.gig
      p "=====/=/=/=/=/======"
      p @gig
      p "=====/=/=/=/=/======"
      @bookmarked = true
    end
  end
end
