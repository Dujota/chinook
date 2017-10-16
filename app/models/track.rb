class Track < ApplicationRecord
SHORT = 180000
LONG  = 360000

  # short hand for the below methods -- it is called scope!!!!!! use it !!!!
  # allows to  write in one line hte below methods

  scope :short, -> { shorter_than(SHORT) }
  scope :long, -> { longer_than_or_equal_to(LONG) }
  scope :medium, -> { longer_than_or_equal_to(SHORT).shorter_than(LONG) }

  # def self.short
  #   shorter_than(SHORT)
  # end
  #
  # def self.long
  #   shorter_than(LONG)
  # end
  #
  # def self.medium
  # longer_than_or_equal_to(SHORT).shorter_than(LONG)
  # end


  scope :shorter_than, -> (milliseconds ) { where('milliseconds < ?', milliseconds) if milliseconds.present? && milliseconds > 0}

  # def self.shorter_than(milliseconds)
  #   where('milliseconds < ?', milliseconds)
  # end

  scope :longer_than_or_equal_to, -> (milliseconds) { where('milliseconds >= ?', milliseconds)}

  # def self.longer_than_or_equal_to(milliseconds)
  #   where('milliseconds >= ?', milliseconds)
  # end


  scope :starts_with, -> (char) { where('name ILIKE  ?', "#{ char }%")}
  # def self.starts_with(char)
  #   where('name ILIKE ?', "#{ char }%")
  # end

end
