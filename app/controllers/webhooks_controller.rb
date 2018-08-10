class WebhooksController < ApplicationController
    def  fb_bot
    	# Userモデルを取得
    	p "====[DEBUG param]===="
    	p params

    	# プレーンテキスト取得
    	message = params["entry"][0]["messaging"][0]

    	# DialogflowへAPI投げる
	    	# {Header} Content-Type: application/json; charset=utf-8 Authorization: Bearer ya29.c.Elr1BWZobY_MwExd18D6zwMrPeqIwfuhBVdiW_qlNP6pSCvKqazOZJQHRMHSsnSD9nao9LFzdC2myzSmxVVfz1BHZ_u4MYqDsp8v3LBfvNZt_e4ERR33xZdjtkk
    		# {body}  {"queryInput": {"text": {"text": "テスト","languageCode": "ja"}},"queryParams": {"timeZone": "Asia/Tokyo"}}
    		# {URL} https://dialogflow.googleapis.com/v2beta1/projects/dateroid-24d1a/agent/sessions/f98c8502-3cf0-8201-f07a-76c47b49a7e5:detectIntent
    	action = response.queryResult

    	# Dialogflowのレスポンスを見てアクション振り分け
    		# Action.allocator(action, mode, user) 的なモジュールを用意すればいいのでは

    	# レスポンス生成
    		# Response.find_match(fb, result) 的な応答を返す変数？
    		# 奈良ちゃんがモジュール化してくれる？
    		# Responseモデルとして管理するのがいいと思われる

    end
end
