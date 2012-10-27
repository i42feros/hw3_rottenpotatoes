# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
	  @movie = Movie.create!(movie)	  
  end

end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"
When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(%r{,\s*}).each do |rating|
    if uncheck
      step %Q{I uncheck "ratings_#{rating}"}
    else
      step %Q{I check "ratings_#{rating}"}
    end 
  end
end

# "Then I should see the following movies: Aladdin, Amelie"
Then /I should (not )?see the following movies: (.*)/ do |not_should, titles_list|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  titles_list.split(%r{,\s*}).each do |title|
    if not_should
      step %Q{I should not see "#{title}"}
    else
      step %Q{I should see "#{title}"}
    end 
  end
end

Then /I should see all of the movies/  do
  db_movies = Movie.all.count
  rows = page.all('table#movies tbody tr').count
  
  if rows == db_movies
    rows == db_movies
  else
    assert rows == db_movies
  end
end

Then /I should see none of the movies/  do
  none = 0
  rows = page.all('table#movies tbody tr').count
  
  if rows == none
    rows == none
  else
    assert rows == none
  end
end

