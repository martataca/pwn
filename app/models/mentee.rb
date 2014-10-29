class Mentee < User
  
 def set_type # If you don't implement this method, an error will be raised
    self.type = 'Mentee'
  end

end
