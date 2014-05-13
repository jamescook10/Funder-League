module LeaguesHelper
  def percentage_format(value)
    sprintf("%#.2f", value) + "%"
  end
end
