Rails.application.routes.draw do
  match 'fb_bot_webhook' => 'webhooks#fb_bot', :via => :post
  match 'line_bot_webhook' => 'webhooks#line_bot', :via => :post
  match 'google_assisntant_ss_webhook' => 'webhooks#google_assisntant_ss', :via => :post
  match 'amason_alexa_ss_webhook' => 'webhooks#amason_alexa_ss', :via => :post
  match 'line_clova_ss_webhook' => 'webhooks#line_clova_ss', :via => :post
end
