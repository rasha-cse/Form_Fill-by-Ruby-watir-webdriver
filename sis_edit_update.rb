#require 'watir'
require "watir-webdriver"
require 'watir-scroll'
require_relative 'methods_new'
require_relative 'methods_edit'
require_relative 'inputs'
require 'net/https'

@browser = Watir::Browser.new :chrome
#@browser.window.maximize

http = Net::HTTP.new(@host, @port)
http.read_timeout = 500
@browser.goto @context

sleep 30                         #manual fix
login_using @username, @password

#fillup_sis_form 'firstname', 'lastname', 'tracking_number', 'medicaid ID', 'lock'
edit_update @first_name, @last_name, @lock_or_unlock

puts "End Point Reached for Individual #{@first_name} #{@last_name} !! :-)"