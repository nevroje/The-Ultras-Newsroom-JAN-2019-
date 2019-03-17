Then("I should see {string}") do |content|
    expect(page).to have_content content
end

Then("I should be on the {string} page") do |page|
    expect(current_path).to eq page 
end

Then("I should not see {string}") do |content|
    expect(page).to have_no_content content
end  