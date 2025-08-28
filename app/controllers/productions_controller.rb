class ProductionsController < ApplicationController
  def index
    @daily_productions = DailyProduction.all.order(date: :desc)
  end

  def import
    # Ici tu traites le CSV uploadé
    # Exemple de pseudo-code :
    # CSV.foreach(params[:file].path, headers: true) do |row|
    #   ...
    # end
    redirect_to root_path, notice: "Import terminé"
  end

  def testlog
    Rails.logger.info "Ceci est un test log !"
    render plain: "Log envoyé, regarde dans les logs du serveur Rails."
  end
end