require 'csv'

class ProductionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:import]
  def index
    @daily_productions = DailyProduction.all.order(date: :desc)
  end

  def import
    file = params[:file]
    if file.nil?
      render json: { message: "Aucun fichier sélectionné" }
      return
    end

    CSV.foreach(file.path, headers: true) do |row|
      inverter = Inverter.find_or_create_by(identifier: row["identifier"])

      dt = DateTime.strptime(row["datetime"], "%d/%m/%y %H:%M")
      date = dt.to_date
      hour = dt.hour

      HourlyProduction.create!(
        inverter: inverter,
        date: date,
        hour: hour,
        energy: row["energy"].to_f
      )
    end

    HourlyProduction.group(:date).sum(:energy).each do |date, total|
      DailyProduction.find_or_create_by(date: date).update(total_energy: total)
    end

    render json: { message: "Import terminé" }
  end

  def daily_by_date
    date = params[:date]

    hourly = HourlyProduction.where(date: date).order(:hour)

    total = hourly.sum(:energy)

    render json: {
      date: date,
      total_energy: total,
      hourly_productions: hourly.map { |h| { hour: h.hour, energy: h.energy } }
    }
  end

  def testlog
    Rails.logger.info "Ceci est un test log !"
    render plain: "Log envoyé, regarde dans les logs du serveur Rails."
  end
end