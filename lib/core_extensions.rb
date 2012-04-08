module CoreExtensions

end

# Opening String class to add numeralize method
class String
  
  def count_words
    return nil if self.blank?
    h = Hash.new
    words = self.split
    words.each do |w|
      h.has_key?(w) ? h[w] += 1 : h[w] = 1 
    end
    h
  end
  
  def count_words_from_file(file = nil)
    the_file = file || "#{Rails.root}/lib/assets/words.txt"
    h = Hash.new
    f = File.open(the_file, "r")
    f.each_line do |line|
      words = line.split
      words.each do |w|
        h.has_key?(w) ? h[w] += 1 : h[w] = 1 
      end
    end
    h
  end
  
  def numeralize
    RomanNumerals.numeralize(self)
  end
  
  def is_roman_numeral?
    RomanNumerals.is_roman_numeral?(self)
  end
end

# Opening Fixnum class to add romanize method
class Fixnum
  
  def romanize
    RomanNumerals.romanize(self) || ''
  end
  
end