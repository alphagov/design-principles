class SearchResult
  attr_accessor :result

  def initialize(result)
    @result = result.stringify_keys!
  end

  def title
    result["title"].gsub(/\AGovernment Service Design Manual: /, '')
  end

  PASS_THROUGH_KEYS = [
    :presentation_format, :link, :description,
    :format, :humanized_format
  ]
  PASS_THROUGH_KEYS.each do |key|
    define_method key do
      result[key.to_s]
    end
  end
end
