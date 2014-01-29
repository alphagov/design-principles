require "csv"

class Terms
  def self.dictionary
    @output ||= self.load_dictionary
  end

  def self.load_dictionary
    output = {}
    ('a'..'z').each do |letter|
      output[letter] = []
    end
    CSV.foreach(Rails.root.join('db', 'a-z.csv')) do |row|
      first_letter = row[0].first.downcase
      output[first_letter] << row
    end
    output
  end

  def self.a_z
    self.dictionary.keys.reject {|l| self.dictionary[l].empty? }
  end
end
