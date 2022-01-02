class Api::V1::GigsController < Api::V1::BaseController
  def index
    @gigs = Gig.all
  end
  def create
    @gig = Gig.new
    # @gig.user = current_user
    @gig.category = Category.find_by()
    @gig.save
  end
  def show
    @gig = Gig.find(params[:id])
  end
  def edit
  end
  def destroy
  end

  private

  def permitted_params
    params.require(:gig).permit(:title, :description)
  end

end
