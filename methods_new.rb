require_relative 'inputs'
#require "watir-webdriver/wait"

$i = 0

def i
  $i = $i + 1
end

def login_using(username, password)
  #sleep 10
  #until @browser.text_field(name: 'userName').exists? do sleep 1 end           #works
  #Watir::Wait.until(15) { @browser.text_field(name: 'userName').visible? }      #works

  @browser.text_field(name: 'userName').set username
  #@browser.text_field(name: 'pwrd').wait_until_present
  @browser.text_field(name: 'pwrd').set password

  @browser.screenshot.save @screenshot_save_path + i.to_s + '.png'
  
  @browser.button(value: 'Login').click
end

def fillup__form(firstname, lastname, middlename, dob, tracking_number, medicaid_id, ri_Pending_Approval, lock)

  @browser.screenshot.save @screenshot_save_path + i.to_s + '.png'

  @browser.button(value: 'Create New -A Assessment').click
  interview_Profile_form firstname, lastname, middlename, dob, tracking_number, medicaid_id

  section1("A")
  section1("B")
  section2_or_3("A")
  section2_or_3("B")
  section2_or_3("C")
  section2_or_3("D")
  section2_or_3("E")
  section2_or_3("F")
  section2_or_3("3")
  supplementary_questions ri_Pending_Approval

  if lock.downcase == 'lock'
    make_locked
  end

end

def interview_Profile_form(firstname, lastname, middlename, dob, tracking_number, medicaid_id)
  sleep 7
  @browser.text_field(name: '_cl_first_nm').set firstname
  sleep 2
  @browser.text_field(name: '_cl_last_nm').set lastname
  sleep 2
  @browser.text_field(name: '_cl_middle_nm').set middlename
  sleep 2
  @browser.text_field(name: '_completed_dt').set '05/11/2017'   #Interview Date
  sleep 2
  @browser.text_field(name: '_track_num').set tracking_number
  @browser.text_field(name: '_cl_medicaidNum').set medicaid_id
  @browser.text_field(name: '_cl_dob_dt').set dob #'05/11/1999'
  @browser.text_field(name: '_startTime').set '11:21PM'
  @browser.text_field(name: '_endTime').set '12:54AM'

  @browser.label(text: 'Male', for: '_cl_sex_cd_m').click

  @browser.text_field(name: '_cl_addr_line1').set 'Test ' + @state + ' Address'
  #@browser.select_list(id: '_cl_cou').select "Adams" if @browser.select_list(id: '_cl_cou').exists?
  @browser.text_field(id: '_cl_city').set 'Test ' + @state + ' City'
  @browser.select_list(id: '_cl_st').select "AL" #if @browser.select_list(id: '_cl_st').exists?
  @browser.text_field(id: '_cl_zip').set '679554'

   scroll_to_field=@browser.text_field(:name => '_entry_firstn')
   #@browser.scroll.to scroll_to_field
   scroll_to_field.scroll.to :bottom
   sleep 3


  @browser.select_list(id: '_int_id_item').select @interview_login_name if @browser.select_list(id: '_int_id_item').exists?  #"TherapRITest (Sazzad Rafique) "/"NDUser (NDUser )"
  @browser.text_field(id: '_int_full_nm').set 'Test ' + @state + ' Interviwer (Rasha)'
  @browser.text_field(id: '_int_position_cd').set 'Test ' + @state + ' Position'
  @browser.text_field(name: '_int_agency_nm').set 'Test ' + @state
  @browser.text_field(name: '_int_phone_num').set "(111)111-1111"
  @browser.text_field(name: '_int_addr_line1').set 'Test ' + @state + ' Address'
  @browser.text_field(name: '_int_email').set 'Test ' + @state + ' Email'
  @browser.text_field(name: '_int_city').set 'Test ' + @state + ' City'
  @browser.text_field(name: '_int_st').set 'Test ' + @state + ' State'
  @browser.text_field(name: '_int_zip').set "808043"

  @browser.text_field(name: '_entry_firstn').set 'Nawshad R'
  @browser.text_field(name: '_entry_lastn').set 'RashaN'

#  @browser.text_field(id: 'txtS1aPageNotes').set 'Test '
#@browser.span(text: 'Save Data and Continue to Profile screen 2').click

  save_and_proceed

  @browser.screenshot.save @screenshot_save_path + i.to_s + '.png'

  @browser.link(text: 'Proceed to Next').click

end

def section1(subsection)
  @browser.td(id: 'td' + @section1_1.to_s + '_1' ).click
  @browser.td(id: 'td' + @section1_2.to_s + '_2' ).click
  @browser.td(id: 'td' + @section1_3.to_s + '_3' ).click
  @browser.td(id: 'td' + @section1_4.to_s + '_4' ).click
  @browser.td(id: 'td' + @section1_5.to_s + '_5' ).click
  @browser.td(id: 'td' + @section1_6.to_s + '_6' ).click
  @browser.td(id: 'td' + @section1_7.to_s + '_7' ).click
  @browser.td(id: 'td' + @section1_8.to_s + '_8' ).click
  @browser.td(id: 'td' + @section1_9.to_s + '_9' ).click
  @browser.td(id: 'td' + @section1_10.to_s + '_10' ).click
  @browser.td(id: 'td' + @section1_11.to_s + '_11' ).click
  @browser.td(id: 'td' + @section1_12.to_s + '_12' ).click
  @browser.td(id: 'td' + @section1_13.to_s + '_13' ).click

  if subsection == "A"
    @browser.td(id: 'td' + @section1_14.to_s + '_14' ).click
    @browser.td(id: 'td' + @section1_15.to_s + '_15' ).click
    @browser.td(id: 'td' + @section1_16.to_s + '_16' ).click
    @browser.td(id: 'td' + @section1_17.to_s + '_17' ).click
    @browser.td(id: 'td' + @section1_18.to_s + '_18' ).click
    @browser.td(id: 'td' + @section1_19.to_s + '_19' ).click

    @browser.textarea(id: 'Q1A19_Other').set 'Test '

  elsif subsection == "B"
    @browser.textarea(id: 'Q1B13_Other').set 'Test '
  end

  save_and_proceed

end

def section2_or_3(subsection)

  #@browser.td(id: 'td1_1_tos').click
  @browser.td(id: 'td' + @type_of_support_1.to_s + '_1_tos' ).click
  @browser.td(id: 'td' + @type_of_support_2.to_s + '_2_tos').click
  @browser.td(id: 'td' + @type_of_support_3.to_s + '_3_tos').click
  @browser.td(id: 'td' + @type_of_support_4.to_s + '_4_tos').click
  @browser.td(id: 'td' + @type_of_support_5.to_s + '_5_tos').click
  @browser.td(id: 'td' + @type_of_support_6.to_s + '_6_tos').click
  @browser.td(id: 'td' + @type_of_support_7.to_s + '_7_tos').click
  @browser.td(id: 'td' + @type_of_support_8.to_s + '_8_tos').click

  @browser.td(id: 'td' + @frequency_1.to_s + '_1_fqy').click   # excluding 4
  @browser.td(id: 'td' + @frequency_2.to_s + '_2_fqy').click   #4
  @browser.td(id: 'td' + @frequency_3.to_s + '_3_fqy').click   #4
  @browser.td(id: 'td' + @frequency_4.to_s + '_4_fqy').click   #4
  @browser.td(id: 'td' + @frequency_5.to_s + '_5_fqy').click   #4
  @browser.td(id: 'td' + @frequency_6.to_s + '_6_fqy').click   #4
  @browser.td(id: 'td' + @frequency_7.to_s + '_7_fqy').click   #3,4
  @browser.td(id: 'td' + @frequency_8.to_s + '_8_fqy').click   #4

  @browser.td(id: 'td' + @daily_support_time_1.to_s + '_1_dst').click
  @browser.td(id: 'td' + @daily_support_time_2.to_s + '_2_dst').click
  @browser.td(id: 'td' + @daily_support_time_3.to_s + '_3_dst').click
  @browser.td(id: 'td' + @daily_support_time_4.to_s + '_4_dst').click  #3,4
  @browser.td(id: 'td' + @daily_support_time_5.to_s + '_5_dst').click
  @browser.td(id: 'td' + @daily_support_time_6.to_s + '_6_dst').click  #4
  @browser.td(id: 'td' + @daily_support_time_7.to_s + '_7_dst').click
  @browser.td(id: 'td' + @daily_support_time_8.to_s + '_8_dst').click  #3,4

  if subsection == 'C'
    @browser.td(id: 'td' + @type_of_support_9.to_s + '_9_tos').click
    @browser.td(id: 'td' + @frequency_9.to_s + '_9_fqy').click
    @browser.td(id: 'td' + @daily_support_time_9.to_s + '_9_dst').click
  end

  save_and_proceed

end

def supplementary_questions(ri_Pending_Approval)
  if(ri_Pending_Approval.capitalize == 'Yes')
  @browser.label(text: 'Yes', for: 'radioIdYes_1').click

  @browser.label(text: 'Yes', for: '_s41a_radio_y').click
  @browser.label(text: 'Yes', for: '_s41b_radio_y').click
  @browser.label(text: 'Yes', for: '_s41c_radio_y').click

  @browser.select_list(name: '_s41d').select '2'
  @browser.select_list(name: '_s41d2').select '2.0'

  else
    @browser.label(text: 'No', for: 'radioIdNo_1').click
  end

  @browser.label(text: 'No', for: 'radioIdNo_2').click
  @browser.label(text: 'No', for: 'radioIdNo_3').click
  @browser.label(text: 'No', for: 'radioIdNo_4').click
  @browser.label(text: 'No', for: 'radioIdNo_5').click
  save_and_proceed

  sleep 4
  @browser.link(text: 'Search for Report(s)').click
=begin
  @browser.link(text: 'Other').click
  sleep 4
  @browser.link(class: 'class_nav', text: 'Search Page').click
  sleep 4
=end
end

def make_locked
  @browser.button(text: 'Search Assessments').click
  sleep 4
  @browser.select_list(name: 'CategoryID', index: 1).select 'Lock'
  sleep 5
  @browser.button(value: 'Go', index: 1).click
  sleep 4
  @browser.button(text: 'Search Assessments').click
  sleep 4
  @browser.screenshot.save @screenshot_save_path + i.to_s + '.png'
end

def save_and_proceed
  @browser.screenshot.save @screenshot_save_path + i.to_s + '.png'

  @browser.link(text: 'Save').click
  sleep 5
  @browser.link(text: 'Proceed to Next').click
  sleep 5
end
