require 'watir'
#require "watir-webdriver"
require 'watir-scroll'
require_relative 'methods_new'
require_relative 'inputs'
require 'net/https'

http = Net::HTTP.new(@host, @port)
http.read_timeout = 500

p start = Time.now

############## setting manual proxy ###############################
profile = Selenium::WebDriver::Firefox::Profile.new
profile.proxy = Selenium::WebDriver::Proxy.new :http => '8.44.213.199:3128', :ssl => '8.44.213.199:3128'
@browser = Watir::Browser.new :firefox, :profile => profile#, headless: true

#@browser = Watir::Browser.new :firefox
@browser.window.maximize

@browser.goto @context

sleep 10                         #manual fix
login_using @username, @password

#@browser.goto 'https://staging2.sis-online.org/Search'

#fillup_sis_form 'firstname', 'lastname', 'tracking_number', 'medicaid ID', 'lock'
for loopcount in 1..@count
  p loopcount
  fillup_sis_form @first_name, @last_name, @middlename, @dob, @tracking_number, @medicaid_id, @RI_Pending_Approval, @lock_or_unlock
  sleep 4
end

puts "SIS Assessment created for Individual #{@first_name} #{@last_name}."
puts "It took " + ((Time.now - start)/60).to_s + " minutes"
