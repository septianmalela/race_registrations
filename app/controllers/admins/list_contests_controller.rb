class Admins::ListContestsController < Admins::AdminBaseController
  include Modules::Crudable

  before_action :set_member_contest, only: :show
  before_action :form_collection, only: %i[new create edit update]
  before_action :to_integer_price_update, only: %i[update]
  before_action :to_integer_price_create, only: %i[create]
  before_action :set_redirect_path, only: %i[create update destroy]

  self.additional_parameters = [
    inventory_attributes: %i[_destroy id stock price inventoryable_id inventoryable_type]
  ]

  def index
    super do
      @list_contests = ListContest.get_list_contests('madya')
      @name_page = 'Madya'
    end
  end

  def list_wira
    @list_contests = ListContest.get_list_contests('wira')
    @name_page = 'Wira'
  end

  def new
    super do
      @list_contest.build_inventory
    end
  end

  private

  def set_member_contest
    @member_contests = @list_contest.member_contests
  end

  def form_collection
    @type_pmrs     = ListContest::type_pmrs.map { |key, value| [key.titleize, key] }
    @type_contests = ListContest::type_contests.map { |key, value| [ListContest.title_names[key.to_sym], key] }
  end

  def to_integer_price_update
    params[:list_contest][:inventory_attributes][:price] = format_rupiah_price
  end

  def to_integer_price_create
    resource.inventory.price = format_rupiah_price
  end

  def format_rupiah_price
    format_price = params[:list_contest][:inventory_attributes][:price].delete('Rp.').strip.to_i
  end

  def set_redirect_path
    self.redirect_path = admins_list_contests_path
  end
end