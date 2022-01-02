class Api::V1::GigsController < Api::V1::BaseController
  def index
    @gigs = Gig.all
  end
  def create
    # make sure  :userId  matches in the front end in create form
    current_user = User.find(params[:userId])
    # Initialize instance variable
    @gig = Gig.new
    @gig.user = current_user
    # make sure  :categoryId  matches in the front end in create form
    @gig.category = Category.find(params[:categoryId])
    @gig.save
  end
  def show
    @gig = Gig.find(params[:id])
  end
  def edit
    @gig = Gig.find(params[:id])
  end
  def favorite
  end
  def show_favorite_gigs
  end
  def destroy
    # TO DO: update to soft delete - change to inactive
    @gig = Gig.find(params[:id])
    @gig.destroy
  end

  # private
  # def permitted_params
  #   params.require(:gig).permit(:title, :description)
  # end

end
