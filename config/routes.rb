Rails.application.routes.draw do
  match 'webhook' => 'main#webhook', :via => :post
end
