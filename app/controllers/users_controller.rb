class UsersController < ApplicationController
  # http_basic_authenticate_with :name => "myfinance", :password => "credit123"
  #skip_before_filter :login
  before_filter :auth_valid_token , :except => [:login]

 def fetch_user
    @user = User.find_by_id(params[:id])
  end

  def login
    email = params[:email]
    password = params[:password]
    @auth_token = Digest::MD5.hexdigest(email+password)
    if @auth_token
      @token_hash = {'status'=> '200' ,'auth_token' => @auth_token}
      user = User.new(:email => email, :password => password, :auth_token => @auth_token)
      user.save
    end

    respond_to do |format|
      format.json { render json: @token_hash }
      format.xml { render xml: @token_hash }
    end
  end

  def index
    @users = User.all
    respond_to do |format|
      format.json { render json: @users }
      format.xml { render xml: @users }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @user }
      format.xml { render xml: @user }
    end
  end


  def create
    @user = User.new(params[:user])
    @user.temp_password = Devise.friendly_token
    respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created }
        format.xml { render xml: @user, status: :created }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.xml { render xml: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.xml { render xml: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @user.destroy
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.xml { render xml: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def auth_valid_token
    auth_token = params[:token]
    user = User.find(:auth_token => 'auth_token')
    if user
      return true
    else
      return false
    end
  end

end