module V1
  class CashGamesController < ApplicationController
    include UserAuthorize
    before_action :check_login

    def index
      @cash_games = CashGame.position_desc.page(params[:page]).per(params[:page_size])
    end

    def check_login
      login_required unless params[:from].eql?('h5')
    end
  end
end
