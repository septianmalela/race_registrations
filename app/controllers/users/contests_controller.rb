class Users::ContestsController < Users::BaseController
  include Modules::Crudable

  self.additional_parameters = [
    member_contests_attributes: %i[id _destroy helper_1 helper_2 helper_3 contest_id list_contest_id]
  ]

  before_action :set_list_contests, only: :index
  before_action :set_collection, only: %i[new create edit update]
  before_action :set_contest, only: %i[new create edit update]
  before_action :set_redirect_path, only: %i[create update]

  def new
    super do
      @contest.member_contests.new
    end
  end

  def create
    super
  end

  private

  def set_list_contests
    @member_contests = current_user.contest.member_contests.includes(:list_contest).order_desc
  end

  def set_collection
    @list_contests = ListContest.list_contest_wira(current_profile.type_pmr)
    @list_contests = build_select_options(@list_contests, { label: %i[title], value: :id })
  end

  def set_contest
    @contest = current_user.contest
  end

  def set_redirect_path
    self.redirect_path = users_contests_path
  end
end