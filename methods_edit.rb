require_relative 'inputs'
require_relative 'inputs_edit'

def sis_edit_update()
  @browser.button(text: 'Search Assessments').click
  sleep 4
  @browser.select_list(name: 'CategoryID', index: 1).select 'Lock'
  @browser.button(value: 'Go', index: 1).click

end