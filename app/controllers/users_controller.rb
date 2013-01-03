class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_account_module
  
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
      #if @user.valid_password?(params[:user][:current_password])
      #  params[:user].delete(:current_password)
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
      #else
      #  @user.errors.add(:base, "The current password is invalid")
      #  format.html  { render action: "edit_self" }
      #  format.json { render json: @user }
      #end
    end
  end

end
