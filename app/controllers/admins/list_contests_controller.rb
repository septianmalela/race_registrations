class Admins::ListContestsController < Admins::AdminBaseController
  include Modules::Crudable

  before_action :set_member_contest, only: :show

  private

  def set_member_contest
     @member_contests = @list_contest.member_contests
   end 
end