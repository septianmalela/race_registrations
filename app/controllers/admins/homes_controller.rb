class Admins::HomesController < Admins::AdminBaseController
  def index
    @member_contests = MemberContest.includes(:list_contest).order_desc

    @type_contest_pmr     = ListContest.title_names
    @member_contest_wira  = ListContest.get_member_contest('wira')
    @member_contest_madya = ListContest.get_member_contest('madya')

    @total_team_wira  = @member_contest_wira.values.sum
    @total_team_madya = @member_contest_madya.values.sum
  end
end