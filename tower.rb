# Klasa reprezentuje wieże Hanoi.
#
# Klasa przechowuje informacje o wieżach (A,B,C), dyskach i liczbie ruchów.
#
# Klasa umożliwia realizację algorytmu układania wieży Hanoi dla podanej
# przez użytkownika liczby dysków.
class Tower
  # Inicjalizacja klasy
  #
  # * disks [Integer] - Liczba dysków, które zostaną umieszczone na początkowej wieży A.
  def initialize(disks)
    @towers = {
      :A => (1..disks).to_a.reverse,
      :B => [],
      :C => []
    }
    @disks = disks
    @count_move = 0
  end

  # Funkcja przenosząca dysk z obecnej wieży na kolejną.
  #
  # * from [Symbol] - Nazwa wieży, na której znajduje się dysk.
  #
  # * to [Symbol] - Nazwa wieży, na którą zostanie przeniesiony dysk.
  #
  # Zwracany typ: brak
  def move_disk(from, to)
    disk = @towers[from].pop
    @towers[to].push(disk)
    @count_move += 1
  end

  # Funkcja wyświetlająca aktualny stan wież.
  #
  # Zwracany typ: brak
  def display
    print "\e[?25l"
    max_disk = @disks
    system('cls') || system('clear')
    width = max_disk * 2 + 1
    min_width = [width,21].min
    scale = max_disk > 10 ? 0.5 : 1.0
    (max_disk.downto(1)).each do |level|
      @towers.each do |tower, disks|
        if disks.size >= level
          disk_size = Integer(disks[level - 1]*scale)
          disk = '=' * [(2 * disk_size - 1),1].max 
          print disk.center(min_width)
        else
          print '|'.center(min_width)
        end
      end
      puts
    end
    puts 'A'.center(min_width) + 'B'.center(min_width) + 'C'.center(min_width)
    puts "Liczba ruchow: #{@count_move}"
    sleep(0.6)
  end

  # Realizacja algorytmu układania wieży Hanoi.
  #
  # * n [Integer] - Liczba dysków wprowadzonych przez użytkownika.
  # 
  # * from [Symbol] - Nazwa wieży początkowej.
  #
  # * add [Symbol] - Nazwa wieży pomocniczej.
  #
  # * to [Symbol] - Nazwa wieży docelowej.
  #
  # Przykład:
  #   tower = Tower.new(3)
  #   tower.hanoi(3,:A,:B,:C)
  #
  # Zwracany typ: brak
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
