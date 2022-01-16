class Api::V1::InquiriesController < Api::V1::BaseController
  def index
    # shows only the inquiries of the current user
    p @inquiries = Inquiry.joins(:gig).where(user: current_user)
  end

  def create
    # p params
    # User sends inquiry about gig to gig poster
    p @gig = Gig.find(params[:gig_id])
    # params[:user_id] comes from front end inquiry.js file: around line 16 const user_id = wx.getStorageSync('user').id
    p @current_user = User.find(params[:user_id])
    # # Initialize instance variable
    @inquiry = Inquiry.new(inquiry_params)
    # connects gig to inquiry (from model)
    @inquiry.gig = @gig
    # connects user to inquiry (from model)
    @inquiry.user = @current_user
    # sets default value of inquiry
    @inquiry.confirm = false
    # @inquiry.save
    # puts "###############"
    p @inquiry
    @inquiry.save
    render json: {
      message: "Message sent"
    }
  end

  def confirm
  end

  def destroy
    # User will erase inquiry if not interested
    # Better to inactivate than hard delete
    @inquiry = Inquiry.find(params[:id])
    @inquiry.destroy
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:user_id, :message)
  end

end
