# Klasa reprezentuje wieże Hanoi.
#
# Klasa przechowuje informacje o wieżach, dyskach i liczbie ruchów.
#
# Klasa umożliwia realizację algorytmu układania wieży Hanoi dla podanej
# przez użytkownika liczby dysków.
class Tower
  # Inicjalizacja klasy
  #
  # * disks [Integer] - Liczba dysków, które zostaną umieszczone na początkowej wieży A.
  def initialize(disks)
    @towers = {
      "A" => (1..disks).to_a.reverse,
      "B" => [],
      "C" => []
    }
    @disks = disks
    @count_move = 0
  end

  # Funkcja przenosząca dysk z obecnej wieży na kolejną.
  #
  # * from [Array] - Obecna wieża, na której znajduje się dysk.
  #
  # * to [Array] - Wieża, na którą zostanie przeniesiony dysk.
  #
  # Zwracany typ: [void]
  def move_disk(from, to)
    disk = @towers[from].pop
    @towers[to].push(disk)
    @count_move += 1
  end

  # Funkcja wyświetlająca aktualny stan wież.
  #
  # Zwracany typ: [void]
  def display
    max_disk = @disks
    system('cls') || system('clear')
    (max_disk.downto(1)).each do |level|
      @towers.each do |tower, disks|
        if disks.size >= level
          print disks[level - 1]&.to_s.center(3) || ' '
        else
          print ' '.center(3)
        end
        print '|'
      end
      puts
    end
    puts ' A   B   C '
    puts "Liczba ruchow: #{@count_move}"
    sleep(0.7)
  end

  # Realizacja algorytmu układania wieży Hanoi.
  #
  # * n [Integer] - Liczba dysków wprowadzonych przez użytkownika.
  # 
  # * from [Array] - Wieża początkowa.
  #
  # * add [Array] - Wieża pomocnicza.
  #
  # * to [Array] - Wieża docelowa.
  # 
  # Zwracany typ: [void]

  def hanoi(n, from, add, to)
    if n == 1
      move_disk(from, to)
      display
    else
      hanoi(n - 1, from, to, add)
      move_disk(from, to)
      display
      hanoi(n - 1, add, from, to)
    end
  end
end
