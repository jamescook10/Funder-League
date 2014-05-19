module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-warning"
    when :alert then "alert alert-danger"
    end
  end

  def css_case(string)
    string.downcase.tr(' ', '-')
  end

  def underscore_case(string)
    string.downcase.tr(' ', '_')
  end

  def percentage_format(value)
    sprintf("%#.2f", value) + "%"
  end
end