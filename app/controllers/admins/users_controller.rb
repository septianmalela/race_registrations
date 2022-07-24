class Admins::UsersController < Admins::AdminBaseController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @member_contests = @user.contest.member_contests
  end
end