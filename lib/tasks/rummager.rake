namespace :rummager do
  task :index do
    require 'rummageable'

    puts File.expand_path("../../../db/index/*.json", __FILE__)
    Dir.glob(File.expand_path("../../../db/index/*.json", __FILE__)).each do |indexable|
      content = File.read(indexable)
      parsed = JSON.parse(content)
      puts "Handling #{parsed.count} records from #{indexable}"
      Rummageable.index(parsed, '/specialist')
    end
  end
end