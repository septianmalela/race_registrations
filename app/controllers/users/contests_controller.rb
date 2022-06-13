class Users::ContestsController < Users::BaseController
  include Modules::Crudable

  before_action :set_list_contests, only: :index

  private

  def set_list_contests
    @member_contests = current_user.contest.member_contests.includes(:list_contest).order_desc
  end
end