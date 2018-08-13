class WebhooksController < ApplicationController
	require 'net/https'
	require 'uri'
	require 'json'

	DIALOGFLOW_API_ENDPOINT = "https://api.dialogflow.com/v1/query?v=20150910"

    def  fb_bot
    	p "====[DEBUG param]===="
    	p params
    	# Userモデルを取得
        user = "" #fordebug

    	# プレーンテキスト取得
    	message = "デート相手を探して" #For Debug
    	#message = params["entry"][0]["messaging"][0]的なのでFB botから取得するように

    	# DialogflowへAPI投げる
	    dialogflow_result_hash = get_dialogflow_result(DIALOGFLOW_API_ENDPOINT, message, 12345)
	    action_name = dialogflow_result_hash["result"]["action"]

    	# Dialogflowのレスポンスを見てアクション振り分け
        Utils::Action.new(user, action_name).execute

    	# レスポンス生成
    		# Response.find_match(fb, result) 的な応答を返す変数？
    		# 奈良ちゃんがモジュール化してくれる？
    		# Responseモデルとして管理するのがいいと思われる

    	render json: {"test": "test2"}
    end

    private

    	def get_dialogflow_result(endpoint, message, session_id)
    		uri = URI.parse(endpoint)

			header = {
				'Content-Type': 'application/json;charset=UTF-8',
				'Authorization': 'Bearer ' + ENV["DIALOGFLOW_CLIENT_ACCESS_TOKEN"]
			}
			body = {
    			contexts: [],
    			lang: "ja",
    			query: message,
    			sessionId: session_id,
    			timezone: "Japan/Tokyo"
  			}

			# Create the HTTP objects
			http = Net::HTTP.new(uri.host, uri.port)
			request = Net::HTTP::Post.new(uri.request_uri, header)
			request.body = body.to_json

			http.use_ssl = true
			http.verify_mode=OpenSSL::SSL::VERIFY_NONE

			# Send the request
			api_response = http.request(request)
			result_hash = JSON.parse(api_response.body)

			return result_hash
		end
end
