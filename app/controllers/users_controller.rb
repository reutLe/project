class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  # page for all users
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  # user profile page
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def login
    if request.post?
      @user = User.find_by_email(params[:user][:email]) || User.new
      unless @user.new_record?
        if @user.password == BCrypt::Engine.hash_secret(params[:user][:password], @user.salt)
          session[:login] = @user.id
          redirect_to @user, notice: 'User was successfully logged in.'
        end
        else
        #render :login , notice: "Username or password isn't correct"
          flash[:notice] = "Invalid username/password combination" if params[:email] || params[:password]
          redirect_to login_users_path
        end
    else
      @user = User.new
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  # registartion
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :admin, :email, :days_in_week)
    end
end
