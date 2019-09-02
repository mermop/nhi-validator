require 'nhi_validator/version'

# From https://www.health.govt.nz/system/files/documents/pages/nhi_validation_routine_march_2017.doc:

# The National Health Index (NHI) number is used by many national and local
# systems to provide a safe and secure reference key for patient data.
# Because of its importance, the NHI number has a built-in validation routine
# that has been designed to allow systems to minimise typographical errors
# as NHI numbers are keyed in.
# NHI number structure
# The NHI number is a unique 7-character identifier
# (3 alphabetical characters followed by 4 numeric characters)
# assigned to a healthcare user by the NHI.
# The first 3 characters of an NHI number must be alphabetic,
# but not 'I' or 'O', to avoid confusion with one and zero.
# The 4th to 6th characters must be numeric.
# The 7th character is also numeric, and is a check digit based on modulus 11.
class NHIValidator
  class Error < StandardError; end
  class << self
    PATTERN = /[a-hj-np-zA-HJ-NP-Z]{3}[0-9]{4}/ # alphabet without I and O
    ALPHABET_OMITTING_I_AND_O = 'abcdefghjklmnpqrstuvwxyz'.freeze

    def valid?(nhi)
      return false unless nhi =~ PATTERN # steps 1-2

      cs = checksum(nhi[0..5]) # steps 3-10
      return false if cs.zero? # step 11

      cs = 11 - cs # step 12
      cs = 0 if cs == 10 # step 13

      nhi[6].to_i == cs
    end

    private

    def checksum(characters)
      total = 0
      characters.each_char.with_index do |character, index|
        total += multiply(character, index)
      end
      total % 11
    end

    def position_in_alphabet(character)
      ALPHABET_OMITTING_I_AND_O.index(character.downcase) + 1
    end

    def multiply(character, position)
      multiplier = (7 - position)
      return character.to_i * multiplier if character =~ /[0-9]/

      position_in_alphabet(character) * multiplier
    end
  end
end
