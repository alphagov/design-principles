class Change
  attr_accessor :title, :content, :updated_at

  def self.all
    r = []
    YAML.load_file(Rails.root + "config/whats-new.yaml").each do |entry|
      c = Change.new
      c.title = "Changes for #{entry['updated_at'].strftime('%e %B %Y')}"
      c.updated_at = entry['updated_at']
      # This should be safe HTML content from YAML
      c.content = entry['content']
      r << c
    end
    r
  end
end
