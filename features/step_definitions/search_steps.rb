When /^I visit the search page$/ do
  visit search_path
end

When /^I search for events by location$/ do
  select "By Location", from: "type"
  fill_in "term", with: "Brooklyn, NY"
  click_button "Search"
end