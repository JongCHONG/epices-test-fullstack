Rails.application.routes.draw do
  root "productions#index"
  post "productions/import", to: "productions#import"
  get "testlog", to: "productions#testlog"
end