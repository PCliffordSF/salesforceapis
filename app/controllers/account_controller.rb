class AccountController < ApplicationController
    
  def rest_index
      
    # create the connection with the Salesforce connected app
    client = Restforce.new :username => ENV['USERNAME'],
      :password       => ENV['PASSWORD'],
      :security_token => ENV['SECURITY_TOKEN'],
      :client_id      => ENV['CLIENT_ID'],
      :client_secret  => ENV['CLIENT_SECRET']
    
    # execute the query
    accounts = client.query("select id, name from account limit 5")
    
    # output the account names
    accounts.each do |account|
      p account.Name
    end
  end

end
