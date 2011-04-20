Given /^the following lessons:$/ do |lessons|
  Lesson.create!(lessons.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) lesson$/ do |pos|
  visit lessons_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following lessons:$/ do |expected_lessons_table|
  expected_lessons_table.diff!(tableish('table tr', 'td,th'))
end
