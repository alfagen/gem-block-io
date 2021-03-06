# creates a new destination address, withdraws from the default label to it, gets updated address balances, gets sent/received transactions, and the current price
#
# basic example: $ API_KEY=TESTNET_API_KEY PIN=YOUR_SECRET_PIN ruby basic.rb
# bundler example: $ API_KEY=TESTNET_API_KEY PIN=YOUR_SECRET_PIN bundle exec ruby basic.rb
#
# adjust amount below if not using the Dogecoin Testnet

require 'block_io'

puts BlockIo.set_options :api_key => ENV['API_KEY'], :pin => ENV['PIN'], :version => 2

begin
  puts BlockIo.get_new_address(:label => 'testDest')
rescue Exception => e
  # if this failed, we probably created testDest label before
  puts e.to_s
end

puts BlockIo.withdraw_from_labels(:from_labels => 'default', :to_label => 'testDest', :amount => '2.5')

puts BlockIo.get_address_balance(:labels => 'default,testDest')

puts BlockIo.get_transactions(:type => 'sent') # API v2 only

puts BlockIo.get_transactions(:type => 'received') # API v2 only

puts BlockIo.get_current_price(:base_price => 'BTC')

