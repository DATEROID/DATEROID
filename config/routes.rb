Rails.application.routes.draw do
  match 'fb_bot_webhook' => 'webhooks#fb_bot', :via => :post
end
