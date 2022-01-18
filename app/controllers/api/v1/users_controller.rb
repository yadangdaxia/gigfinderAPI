class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:login]
  URL = "https://api.weixin.qq.com/sns/jscode2session".freeze
  # See this documentation for url -> https://developers.weixin.qq.com/miniprogram/dev/api-backend/open-api/login/auth.code2Session.html#%E8%AF%B7%E6%B1%82%E5%9C%B0%E5%9D%80

  # Disable forgery protection on this activity
  before_action :find_user, only: [:show, :update, :image_upload]

  def index
    if params["bookmark"].present?
      @users = User.where("id IN (SELECT t.talent_id FROM talent_bookmarks t WHERE t.user_id = ?)", current_user.id)
    else
      @users = User.all
      if params["query"].present?
        @users= User.search_by_talent(params["query"])

      end
    end
  end

  def new
  end
  def create
  end
  def show
  end

  def find_user
    puts "find_user"
    @user = User.find(params[:id])
    @bookmarked = TalentBookmark.find_by(user: current_user, talent: @user).present?

  end

  # below code added to permit photo to be updated by user
  # def user_params
  #   params.require(:user).permit(:name, :image, :description, :rate, :contact, :talent)
  # end

  # This is the API endpoint method - you get the open_id from this.
  def login
    # Store info in backend. Use p to see login history.
    p "--- Start Login ---"
    open_id = wechat_user.fetch('openid')
    p "----OPENID HERE --"
    p open_id

    # Create user based on open_id
    @user = User.find_or_create_by(open_id: open_id)
    # Creates ID for user, passes to frontend
    render json: {
      userId: @user.id,
      currentUser: @user,
      headers: {"X-USER-ID" => @user.id}
    }
  end

  # Use update method to access additional properties (e.g. name, gender, avatar, etc.)
  def update
    p "inside users update"
    p "user: #{@user.id}"
    # Params since we passed userInfo as data in frontend (index.js getUserProfile function)
    user_info = params[:userInfo]

    if user_info.present?
      p "--- User Info ---"
      p user_info
      # Update nickname, avatar, etc. from data given in frontend
      # This comes from schema
      @user.name = user_info[:nickName]
      @user.gender = user_info[:gender]
      @user.image = user_info[:avatarUrl]

      p "----USER HERE 1-----"
      p @user

      @user.save!

      p "----USER HERE 2-----"
      p @user
      render json: { currentUser: @user }
    else
      @user.update(user_params)
      render json: { currentUser: @user }
    end
  end

  def image_upload
    # .attach is an active storage method
    @user.image_attachment.attach(params[:file])
    user = @user.as_json
    # user["image"] = @user.image_attachment.service_url
    user["image"] = @user.image_attachment.service_url
    render json:  { currentUser: user }
  end

  private

  # This is how we get the information from wechat platform
  def wechat_user
    # To get secret id, type this in terminal to open file:  EDITOR="code -w" rails credentials:edit
    wechat_params = {
      appId: Rails.application.credentials[:wx_app_id],
      secret: Rails.application.credentials[:app_secret_id],
      # Response from miniprogram
      js_code: params[:code],
      grant_type: 'authorization_code'
    }
    p "===========================1",wechat_params
    # Now using gem that lets us access data
    p "--- WeChat Response ---"
    @wechat_response = RestClient.get(URL, params: wechat_params)
    p "--- Response Body ---"
    @wechat_user = JSON.parse(@wechat_response.body)
  end

  def user_params
    params.require(:user).permit(:name, :rate, :description, :talent, :image, :contact)
  end
end
