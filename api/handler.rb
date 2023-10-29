# https://www.serverless.com/plugins/serverless-ruby-package
load "vendor/bundle/bundler/setup.rb"
require 'json'
require 'aws-sdk-dynamodb'

def hello(event:, context:)
  {
    statusCode: 200,
    body: JSON.generate(
      {
        event: event,
        context: context,
      }
    )
  }
end

def get_users(event:, context:)
   response = dynamo_db_client.scan(table_name: table_name)

   # ここで必要な処理を実行
   # 例: レスポンスをJSON形式で返す
   {
     statusCode: 200,
     body: response.items.to_json
   }
end

def create_users(event:, context:)
  # リクエストボディから項目の情報を取得
  request_body = JSON.parse(event['body'])
  item = {
    'user_id' => request_body['user_id'],
    'user_name' => request_body['user_name'],
  }

  # 項目を作成
  dynamo_db_client.put_item({
    table_name: table_name,
    item: item
  })

  # レスポンスを返す
  {
    statusCode: 200,
    body: item.to_json
  }
end


# DynamoDBクライアントを初期化
def dynamo_db_client
  if ENV['STAGE'] == 'local'
    Aws::DynamoDB::Client.new(
      region: 'ap-northeast-1',
      access_key_id: "dummy",
      secret_access_key: "dummy",
      endpoint: "http://localstack:4566"
    )
  else
    Aws::DynamoDB::Client.new
  end
end

def table_name
  ENV['DYNAMO_DB_TABLE_NAME']
end

