Rails.application.routes.draw do
  root "productions#index"
  post "productions/import", to: "productions#import"
  get "productions/daily/:date", to: "productions#daily_by_date"
  get "testlog", to: "productions#testlog"
end