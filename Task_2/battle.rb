def menu_view
  puts "#============================================#"
  puts '#          Welcome to Battle Arena           #'
  puts "#--------------------------------------------#"
  puts "#Description :                               #"
  puts '# 1. ketik "new" untuk membuat karakter      #'
  puts '# 2. ketik "start" untuk memulai pertarungan #'
  puts "# 3. Keluar                                  #"
  puts "#--------------------------------------------#"
end

def battle_view
  puts "#============================================#"
  puts '#          Welcome to Battle Arena           #'
  puts "#--------------------------------------------#"
end

def menu_1
  puts '#Masukkan Nama Player                        #'
  puts '#*max player 3                               #'
  puts '#Nama : '
end

def menu_2_attack
  puts "Siapa yang akan menyerang :"
end

def menu_2_target
  puts "Siapa yang diserang :"
end

def cari list
  idx =-1
  while idx == -1 do
    puts "Nama : "
    nama = gets
    n = 0
    ketemu = false
    while !ketemu and n< list.length do
      if list[n].nama == nama
        ketemu = true
      else
        n += 1
      end
    end
    if ketemu 
      idx = n
    else
      puts "Tidak ada player dengan nama tersebut"
    end
  end
  return idx
end

#variabel
require '~/learn-git-local/Task_2/player.rb'
heroes = Array.new
menu = 0

#index
while menu.to_f != 3 do
  if menu.to_f == 0
    #View menu and show list of heroes
    menu_view
    puts '#Current Player :                            #'
    if heroes.length == 0
      puts "                    -             "
    else
      heroes.each do |hero|
        puts hero.nama+ " :manna="+ hero.mana.to_s + ", blood="+hero.blood.to_s
      end
    end
    puts '#*max player 3                               #'
    if heroes.length >= 2
      puts "#Sudah dapat memulai Pertarungan             #"
    end
    puts '#--------------------------------------------#'
    puts "#Menu :"
    menu = gets
  
  #Untuk menambah player
  #di cek jumlah player terlebih dahulu
  #Masih bisa ditambahkan jika kuang dari 3
  elsif menu.to_f == 1
    if heroes.length > 2
      puts "Count of Heroes reach Max"
    else
      menu_1
      nama = gets
      hero = Player.new nama
      heroes << hero
    end
    menu=0

  #memulai penyerangan
  elsif menu.to_f ==2
    if heroes.length >= 2
      battle_view
      puts "Battle Start :"
      lose="-"
      while lose == "-" do
        menu_2_attack
        idx = cari heroes
        heroes[idx].attack
        if heroes[idx].mana == 0
          lose = heroes[idx].nama
        end
        menu_2_target
        idx = cari heroes
        heroes[idx].attacked
        puts "Description :"
        heroes.each do |hero|
          puts hero.nama+ " :manna="+ hero.mana.to_s + ", blood="+hero.blood.to_s
        end
      end
      puts "#----------------------------------#"
      puts "#          " + lose 
      puts "#        retreat the battle        #"
      puts "#          Game Over               #"
      puts "#----------------------------------#"
      heroes = Array.new
      menu = 0
    else
      puts "#----------------------------------#"
      puts "#        Jumlah Player             #"
      puts "#        Tidak Mencukupi           #"
      puts "#----------------------------------#"
      menu = 0
    end
  #tampilan jika menu diluar pilihan yang ada
  else
    puts "Pilihan Menu tidak terdeteksi"
    menu=0
  end

end
