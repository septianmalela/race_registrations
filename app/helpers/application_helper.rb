module ApplicationHelper
  def build_select_options(objects, columns = {})
    data  = []
    label_n = columns[:label] || get_label(objects)
    value_n = columns[:value] || :id

    if objects.present?
      objects.each do |object|
        # set select option label
        label = label_n.map { |lbl| object.send(lbl).to_s }.join(' - ')
        # set select option value
        value = object.send(value_n)

        data << [label, value]
      end
    end

    data
  end

   def flash_message
    tag.div(class: 'flash-messages') do
      flash.map do |key, value|
        tag.div(class: "alert #{key == 'notice' ? 'alert-success' : 'alert-danger'}") do
          tag.span('&times;'.html_safe, class: :close, 'data-dismiss' => 'alert') + value
        end
      end.join.html_safe
    end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render('users/contests/partial/member_contest_fields', f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def label_yes_no(condition = nil)
    # def label_yes_no(condition = nil, locale = :en)
    # label_yes = I18n.t("global.is_yes", locale: locale)
    # label_no  = I18n.t("global.is_no", locale: locale)
    label_yes = 'Yes'
    label_no  = 'No'

    return label_yes if condition.eql?(true) || condition.try(:downcase).eql?('true')

    label_no
  end

  def format_money(payment)
    number_to_currency(payment, unit: 'Rp. ', separator: ".", precision: 0)
  end
end
