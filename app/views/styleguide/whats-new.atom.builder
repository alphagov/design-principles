atom_feed language: 'en-GB', root_url: "/design-principles/style-guide" do |feed|
  feed.title 'GDS Content style guide changes'
  feed.author do |author|
    author.name 'UK government'
  end
  feed.updated @changes.first.updated_at
  @changes.each do |change|
    feed.entry(change,
      id: "tag:#{request.host},2005:/design-principles/style-guide/changes/#{change.updated_at}",
      url: "#{request.protocol}#{request.host}/design-principles/style-guide") do |entry|
      entry.title(change.title)
      entry.content(change.content, type: 'html')
    end
  end
end
