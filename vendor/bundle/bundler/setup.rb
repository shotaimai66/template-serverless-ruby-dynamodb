require 'rbconfig'
ruby_engine = RUBY_ENGINE
ruby_version = RbConfig::CONFIG["ruby_version"]
path = File.expand_path('..', __FILE__)
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/aws-eventstream-1.2.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/aws-partitions-1.835.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/aws-sigv4-1.6.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/jmespath-1.6.2/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/aws-sdk-core-3.185.1/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/aws-sdk-dynamodb-1.95.0/lib"
$:.unshift "#{path}/"
