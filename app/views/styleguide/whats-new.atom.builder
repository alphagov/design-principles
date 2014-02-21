atom_feed language: 'en-GB', root_url: "style-guide.atom" do |feed|
  feed.title 'Content style guide changes'
  feed.author do |author|
    author.name 'HM Government'
  end
  @changes.each do |change|
    feed.entry(change,
      id: "tag:#{request.host},2005:Change/#{change.updated_at}",
      url: "#{request.protocol}#{request.host}/design-principles/style-guide") do |entry|
      entry.title(change.title)
      entry.content(change.content, type: 'html')
    end
  end
end
