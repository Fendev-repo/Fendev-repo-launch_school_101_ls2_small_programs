# Pseudo-Code for a method that takes an array of integers, and returns a new array with every other element


=begin
START of program
SET array_of_integers to array argument
SET every_other_array to an empty array
SET counter variable to zero

WHILE array_of_integers >= counter
  if counter is even 
    then append array_of_integers[counter] to every_other_array
  End   
  add one to counter variable 
End of interation     
  return every_other_array
END of program  
=end


# Translation of Pseudocode to Ruby code

def array_of_every_other(array)
  every_other_array = []
  array.select do |index|
    if index == 0 || index % 2 == 0
      every_other_array << index 
    end
  end
  every_other_array
end


p array_of_every_other([1,2,3,4,5,6,7,8,9])
