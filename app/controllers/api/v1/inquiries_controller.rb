class Api::V1::InquiriesController < Api::V1::BaseController
  def index
    @inquiries = Inquiry.all
  end
  def create
    # User sends inquiry about gig to gig poster
    ## HOW to do this??

    @gig = Gig.find(params[:gig_id])

    current_user = User.find(params[:userId])
    # Initialize instance variable
    @inquiry = Inquiry.new
    @inquiry.user = current_user

    @inquiry.save
  end

  def confirm
  end
  def destroy
    # User will erase inquiry if not interested
    # Better to inactivate than hard delete
    @inquiry = Inquiry.find(params[:id])
    @inquiry.destroy
  end
end
