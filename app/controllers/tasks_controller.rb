class TasksController < ApplicationController
  before_filter :auth_valid_token
  def all_tasks
    @tasks = Task.find(:status => '1')
    respond_to do |format|
      format.json { render json: @tasks }
      format.xml { render xml: @tasks }
    end
  end

  def task_user
    email = params[:email]
    user = User.find(:email => email)
    if user
      @tasks = TaskUser.find(:user_id => user.id, :created_at < (time.now()-24) )
    else

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
