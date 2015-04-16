namespace :rummager do
  task :index do
    require 'plek'
    require 'rummageable'

    puts File.expand_path("../../../db/index/*.json", __FILE__)
    Dir.glob(File.expand_path("../../../db/index/*.json", __FILE__)).each do |indexable|
      content = File.read(indexable)
      parsed = JSON.parse(content)
      puts "Handling #{parsed.count} records from #{indexable}"

      rummageable_index = Rummageable::Index.new(Plek.current.find('rummager'), '/service-manual')
      rummageable_index.add_batch(parsed)
    end
  end
end
