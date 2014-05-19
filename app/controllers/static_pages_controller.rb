include ApplicationHelper

class StaticPagesController < ApplicationController

  def home
    @game_types = GameType.all.includes(:players)
  end

  def rules
  end

  def faq
  end
end
