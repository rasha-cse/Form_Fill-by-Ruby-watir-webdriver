require_relative 'inputs'
require "watir-webdriver/wait"

def login_using(username, password)

  #until @browser.text_field(name: 'userName').exists? do sleep 1 end
  Watir::Wait.until(15) { @browser.text_field(name: 'userName').visible? }

  @browser.text_field(name: 'userName').set username
  #@browser.text_field(name: 'pwrd').wait_until_present
  @browser.text_field(name: 'pwrd').set password
  @browser.button(value: 'Login').click
end

def fillup_form(firstname, lastname, tracking_number, medicaid_id, lock)

  @browser.button(value: 'Create New -A Assessment').click
  interview_Profile_form firstname, lastname, tracking_number, medicaid_id

  section1("A")
  section1("B")
  section2_or_3("A")
  section2_or_3("B")
  section2_or_3("C")
  section2_or_3("D")
  section2_or_3("E")
  section2_or_3("F")
  section2_or_3("3")
  supplementary_questions

  if lock.downcase == 'lock'
    make_locked
  end

end

def interview_Profile_form(firstname, lastname, tracking_number, medicaid_id)
  @browser.text_field(name: '_cl_first_nm').set firstname
  @browser.text_field(name: '_cl_last_nm').set lastname
  @browser.text_field(name: '_completed_dt').set '05/11/2019'   #Interview Date
  @browser.text_field(name: '_track_num').set tracking_number
  @browser.text_field(name: '_cl_medicaidNum').set medicaid_id
  @browser.text_field(name: '_cl_dob_dt').set '05/11/2000'
  @browser.text_field(name: '_startTime').set '03:00PM'
  @browser.text_field(name: '_endTime').set '04:00PM'

  @browser.label(text: 'Male', for: '_cl_sex_cd_m').click

  @browser.text_field(name: '_cl_addr_line1').set 'Test Address'
#  @browser.select_list(id: '_cl_cou').select "Golden Valley" if @browser.select_list(id: '_cl_cou').exists?
  @browser.text_field(id: '_cl_city').set "Test City"
#  @browser.select_list(id: '_cl_st').select "AZ" if @browser.select_list(id: '_cl_st').exists?
  @browser.text_field(id: '_cl_zip').set 'Test Zip'
  @browser.select_list(id: '_int_id_item').select "NDUser (NDUser )" if @browser.select_list(id: '_int_id_item').exists?
  @browser.text_field(id: '_int_full_nm').set 'Test Interviwer'
  @browser.text_field(id: '_int_position_cd').set 'Test Position'
  @browser.text_field(name: '_int_agency_nm').set 'Test'
  @browser.text_field(name: '_int_phone_num').set "(111)111-1111"
  @browser.text_field(name: '_int_addr_line1').set 'Test Address'
  @browser.text_field(name: '_int_email').set 'Test Email'
  @browser.text_field(name: '_int_city').set 'Test City'
  @browser.text_field(name: '_int_st').set 'Test State'
  @browser.text_field(name: '_int_zip').set "Test Zip"

  @browser.text_field(name: '_entry_firstn').set 'Nawshad'
  @browser.text_field(name: '_entry_lastn').set 'Rasha'

  @browser.text_field(id: 'txtS1aPageNotes').set 'Test'
  #@browser.span(text: 'Save Data and Continue to Profile screen 2').click

  save_and_proceed
  @browser.link(text: 'Proceed to Next').click

end

def section1(subsection)

  @browser.td(id: 'td0_1').click
  @browser.td(id: 'td1_2').click
  @browser.td(id: 'td2_3').click
  @browser.td(id: 'td0_4').click

  @browser.td(id: 'td1_5').click
  @browser.td(id: 'td2_6').click
  @browser.td(id: 'td0_7').click

  @browser.td(id: 'td1_8').click
  @browser.td(id: 'td2_9').click

  @browser.td(id: 'td0_10').click
  @browser.td(id: 'td1_11').click
  @browser.td(id: 'td2_12').click
  @browser.td(id: 'td0_13').click
  if subsection == "A"
    @browser.td(id: 'td1_14').click
    @browser.td(id: 'td2_15').click
    @browser.td(id: 'td0_16').click
    @browser.td(id: 'td1_17').click
    @browser.td(id: 'td2_18').click
    @browser.td(id: 'td0_19').click

    @browser.text_field(id: 'Q1A19_Other').set 'Test'

  elsif subsection == "B"
    @browser.text_field(id: 'Q1B13_Other').set 'Test'
  end

  save_and_proceed

end

def section2_or_3(subsection)

  @browser.td(id: 'td1_1_tos').click
  @browser.td(id: 'td2_2_tos').click
  @browser.td(id: 'td3_3_tos').click
  @browser.td(id: 'td4_4_tos').click
  @browser.td(id: 'td1_5_tos').click
  @browser.td(id: 'td2_6_tos').click
  @browser.td(id: 'td3_7_tos').click
  @browser.td(id: 'td4_8_tos').click

  @browser.td(id: 'td1_1_fqy').click   # excluding 4
  @browser.td(id: 'td2_2_fqy').click   #4
  @browser.td(id: 'td3_3_fqy').click   #4
  @browser.td(id: 'td2_4_fqy').click   #4
  @browser.td(id: 'td1_5_fqy').click   #4
  @browser.td(id: 'td2_6_fqy').click   #4
  @browser.td(id: 'td1_7_fqy').click   #3,4
  @browser.td(id: 'td1_8_fqy').click   #4

  @browser.td(id: 'td1_1_dst').click
  @browser.td(id: 'td4_2_dst').click
  @browser.td(id: 'td3_3_dst').click
  @browser.td(id: 'td2_4_dst').click  #3,4
  @browser.td(id: 'td1_5_dst').click
  @browser.td(id: 'td2_6_dst').click  #4
  @browser.td(id: 'td4_7_dst').click
  @browser.td(id: 'td1_8_dst').click  #3,4

  if subsection == 'C'
    @browser.td(id: 'td1_9_tos').click
    @browser.td(id: 'td2_9_fqy').click
    @browser.td(id: 'td3_9_dst').click
  end

  save_and_proceed

end

def supplementary_questions
  @browser.label(text: 'No', for: 'radioIdNo_1').click
  @browser.label(text: 'No', for: 'radioIdNo_2').click
  @browser.label(text: 'No', for: 'radioIdNo_3').click
  @browser.label(text: 'No', for: 'radioIdNo_4').click
  save_and_proceed
end

def make_locked
  @browser.link(text: 'Other').click
  sleep 4
  @browser.link(class: 'class_nav', text: 'Search Page').click
  sleep 4
  @browser.select_list(name: 'CategoryID').select 'Lock'
  @browser.button(value: 'Go').click
end

def save_and_proceed
  @browser.link(text: 'Save').click
  sleep 5
  @browser.link(text: 'Proceed to Next').click
  sleep 5
end
