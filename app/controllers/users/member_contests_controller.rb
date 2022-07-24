class Users::MemberContestsController < Users::BaseController
  def show
    @member_contest = MemberContest.find(params[:id])
  end
end