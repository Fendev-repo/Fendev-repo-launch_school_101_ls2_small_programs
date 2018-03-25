# Pseudo-Code for a method that takes an array of strings, and returns a string that is all those strings concatendated together.

=begin
START of program
SET counter_variable to zero
SET strings_concatenated to empty string
UNTIL lenght of array is >= counter
  append string in each array to strings_concatenated
  add one to counter variable
END of interation
  Return strings_concatenated
END of program  
=end


# Translation of Pseudocode to Ruby code 
def concatenate_array_of_strings(array)
  counter = 0
  strings_concatenated = ''

  until array.length <= counter 
    strings_concatenated << array[counter]
    counter += 1
  end
  strings_concatenated   
end

puts concatenate_array_of_strings(['hello', 'how', 'are', 'you'])


# Or using built-in Ruby algorithm 'join' on array.
def concatenate_array_of_strings(array)
  array_of_strings_concatenated = array.join
end

puts concatenate_array_of_strings(['hello', 'how', 'are', 'you'])