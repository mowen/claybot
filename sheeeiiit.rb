class Sheeeiiit

  @@min_e_or_i = 5
  @@max_e_or_i = 10
  
  def self.generate
    num_of_e = rand(@@max_e_or_i) + @@min_e_or_i
    num_of_i = rand(@@max_e_or_i) + @@min_e_or_i 
    "Sh" + "e" * num_of_e + "i" * num_of_i + "t!"
  end

end
