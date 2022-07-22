class Admins::ListContestsController < Admins::AdminBaseController
  include Modules::Crudable

  before_action :set_member_contest, only: :show

  def index
    super do
      @list_contests = ListContest.get_list_contests('madya')
    end
  end

  def list_wira
    @list_contests = ListContest.get_list_contests('wira')
  end

  private

  def set_member_contest
     @member_contests = @list_contest.member_contests
   end 
end