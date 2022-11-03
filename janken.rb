def janken
  choices = ["グー", "チョキ", "パー", "戦わない"]
  
  puts "[0]:グー\n[1]:チョキ\n[2]:パー\n[3]:戦わない"
  
  player_choice = choices[gets.to_i]
  
  cp_choice = choices[rand(3)]
  
  if player_choice == "戦わない"
    puts "命拾いしましたね"
    
  else
    puts "あなたは#{player_choice}を出しました"
    puts "cpは#{cp_choice}を出しました"
    if player_choice == cp_choice
      puts "あいこで"
      return true
      
  　elsif (player_choice == "グー" && cp_choice == "チョキ") || (player_choice == "チョキ" && cp_choice == "パー") || (player_choice == "パー" && cp_choice == "グー") 
      puts "あなたの勝ちです"
      #player = "janken_winner"
      return false
    else
      puts "あなたの負けです"
      #player = "janken_loser"
      return false
    end
  end
end
  
janken_start = true
player = nil

puts "最初はグー。じゃんけん..."

while janken_start do
  janken_start = janken
end

=begin
  
def atti_muite_hoi
  puts "あっち向いて~"
  
  choices = ["上", "下", "右", "左"]
  
  puts "[0]:上\n[1]:下\n[2]:右\n[3]：左"
  
  player_choice = choices[gets.to_i]
  cp_choice = choices[rand(3)]
  
  if player == "janken_winner"
    puts "あなたは#{player_choice}を指差しました"
    puts "cpは#{cp_choice}を向きました"
      if player_choice == cp_chice
        puts "あなたの勝ちです"
      else
        puts "引き分けです"
      end
    
  elsif player == "janken_loser"
    puts "cpは#{cp_choice}を指さしました"
    puts "あなたは#{player_choice}を向きました"
      if cp_chioce == palyer_choice
        puts "あなたの負けです"
      else
        puts "引き分けです"
      end
  end
end
  
  
if janken_start == f
  atti_muite_hoi
end
  
=end
