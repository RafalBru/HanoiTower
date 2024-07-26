# Import pliku z tego samego katalogu
require_relative 'tower.rb'

# Podanie przez użytkownika liczbę dysków
print "Podaj liczbe dyskow: "
n = Integer(gets)
while n < 3
  print "Podaj liczbe dyskow wieksza badz rowna 3!"
  n = Integer(gets)
end

#Inicjacja klasy Tower i rozpoczęcie układanias
tower = Tower.new(n)
tower.display
tower.hanoi(n,'A','B','C')