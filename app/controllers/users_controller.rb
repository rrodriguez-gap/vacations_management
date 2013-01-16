class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_account_module, :only=>[:edit_self, :update_self]
  before_filter :set_users_module, :except=>[:edit_self, :update_self]
  
  # GET /employees
  # GET /employees.json
  def edit_self
    @user = current_user

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
    end
  end
  
  # GET /employees
  # GET /employees.json
  def update_self
    @user = current_user
    respond_to do |format|
      if @user.update_with_password(params[:user])
        format.html {  
          sign_in(current_user, :bypass => true)
          flash[:notice] = "Your account was updated successfully"
          redirect_to root_path
        }
        format.json { render json: @user }
      else
        format.html  { render action: "edit_self" }
        format.json { render json: @user }
      end
    end
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html {  
          flash[:notice] = "You just created a new account. Please inform the admin."
          redirect_to users_path
        }
        format.json { render json: @user }
      else
        format.html {
          render action: "new", controller: 'users'
        }
        format.json { render json: @user }
      end
    end
  end
  
  def index
    @users = User.all
  end
  
  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to users_path
  end

end
