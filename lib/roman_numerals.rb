# Methods to convert Indo-Arabic to Roman numeral and vice versa.
module RomanNumerals
  
  # Regex to check for Roman input
  REGEXP = /^M*(D?C{0,3}|C[DM])(L?X{0,3}|X[LC])(V?I{0,3}|I[VX])$/i
  
  # Maps Roman numeral digits to their integer values
  DIGITS = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }
  
  # Maps some integers to their Roman numeral values
  @@digits_lookup = DIGITS.inject({
    4 => 'IV',
    9 => 'IX',
    40 => 'XL',
    90 => 'XC',
    400 => 'CD',
    900 => 'CM'}) do |result, hash_pair|
    result.update({hash_pair.last => hash_pair.first})
  end
  
  # Converts Integer to a Roman numeral
  def self.romanize(int)
    return nil if int < 0
    remainder = int
    result = ''
    @@digits_lookup.keys.sort.reverse.each do |digit_value|
      while remainder >= digit_value
        remainder -= digit_value
        result += @@digits_lookup[digit_value]
      end
      break if remainder <= 0
    end
    result
  end
  
  # Converts Roman String, a Roman numeral, to an integer
  def self.numeralize(roman_string)
    return nil unless roman_string.is_roman_numeral?
    last = nil
    roman_string.to_s.upcase.split(//).reverse.inject(0) do |result, roman_literal|
      if digit_value = DIGITS[roman_literal]
        if last && last > digit_value
          result -= digit_value
        else
          result += digit_value
        end
        last = digit_value
      end
      result
    end
  end
  
  # Returns true if string is a Roman numeral.
  def self.is_roman_numeral?(string)
    REGEXP =~ string
  end
end