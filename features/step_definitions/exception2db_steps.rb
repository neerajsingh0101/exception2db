Given /^an exception2db exists$/ do
  Exception2db.create(:exception => $exception_data_xml)
end

Then /^I should see a link with text "(.*)" within "(.*)" with url "(.*)"$/ do |text, selector, url|
  with_scope(selector) do
    page.find_link(text)[:href].should == url
  end
end

Then /^I should see response code as (.*)$/ do |response_code|
  puts page.inspect
end

Given /^I have been granted read access$/ do
  Exception2dbConfig.set = ({:is_allowed_to_view => Proc.new { |controller| true } })
end

Given /^I have not been granted read access$/ do
  Exception2dbConfig.set = ({:is_allowed_to_view => Proc.new { |controller| false } })
end

