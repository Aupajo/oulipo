class Oulipo
  ALPHABET = 'a'..'z'
  
  def self.absent_letters(string)
    present_letters = string.downcase.split('').uniq
    missing_letters = ALPHABET.to_a - present_letters
    missing_letters.empty? ? nil : missing_letters
  end
  
  # A pangram uses all letters
  def self.pangram?(string)
    self.absent_letters(string).nil?
  end
  
  # A lipogram has missing letters
  def self.lipogram?(string)
    !self.pangram?(string)
  end
end