class UsersController < ApplicationController

  def index
    @users = User.all.order({ :username => :asc })

    render({ :template => "users/index.html.erb" })
  end


  def show
    the_username = params.fetch("the_username")
    @user = User.where({ :username => the_username }).at(0)
    @user_id = session.fetch(:user_id)

    render({ :template => "users/show.html.erb" })
  end

end