class Api::V1::GigsController < Api::V1::BaseController
  before_action :set_gig, only: [ :show, :update ]
  def index
    @gigs = Gig.all
  end
  def create
    @gig = gig.new(gig_params)
    if @gig.save
      render :show
    else
      render_error
    end
  end

    # Refer to photo if you need to go back
    # make sure  :user_id  matches in the front end in create form
    # current_user = User.find(params[:user_id])
    # Initialize instance variable
    # @gig = Gig.new(gig_params)
    # @gig.user = current_user
    # make sure  :category_id  matches in the front end in create form
    # @gig.category = Category.find(params[:category_id])
    # @gig.save
  def show

    # uncomment if above doesn't work

  end
  # change to update from edit
  def update
    p "================== started update ============="
    if @gig.update!(gig_params)
      render :show
    else
      render_error
    # @gig = Gig.find(params[:id])
    end
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

  private
  def set_gig
      @gig = Gig.find(params[:id])
  end
  # Params for user input
  def gig_params
    params.require(:gig).permit(:title, :rate, :description, :location, :category_id)
  end

  def render_error
    render json: {errors: @gig.errors.full_messages},
      status: :unprocessable_entity
  end

end
