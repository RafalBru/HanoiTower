# Import pliku (tower.rb) z tego samego katalogu
require_relative 'tower.rb'

# Podanie przez użytkownika liczby dysków
print "Podaj liczbe dyskow: "
n = Integer(gets)
while n < 3
  puts "Podaj liczbe dyskow wieksza badz rowna 3!"
  print "Podaj liczbe dyskow: "
  n = Integer(gets)
end

# Inicjacja klasy Tower i rozpoczęcie układania
tower = Tower.new(n)
tower.display
tower.hanoi(n,:A,:B,:C)
