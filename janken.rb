#janken メソッドを定義する
def janken
  choices = ["グー", "チョキ", "パー", "戦わない"]
  
  puts "[0]:グー\n[1]:チョキ\n[2]:パー\n[3]:戦わない"
  
  player_choice = choices[gets.to_i]
  
  cp_choice = choices[rand(3)]
  
  if player_choice == "戦わない"
    puts "-----------------------------------"
    puts "ニンゲントハ オクビョウナ モノダナ"
    puts "-----------------------------------"
    
  else
    puts "あなたは#{player_choice}を出しました"
    puts "cpは#{cp_choice}を出しました"
    if player_choice == cp_choice
      puts "--------"
      puts "あいこで"
      puts "--------"
      # このメソッド内の情報を、このメソッド外の分岐条件に使用したいため、returnメソッドを用いて、呼び出し元に情報を返す
      return "aiko"
      
  　elsif (player_choice == "グー" && cp_choice == "チョキ") || (player_choice == "チョキ" && cp_choice == "パー") || (player_choice == "パー" && cp_choice == "グー") 
      puts "----------------------------------------------------------"
      puts "じゃんけんは、あなたの勝ちです"
      puts "あっちむいてほいにうつります。勝者のあなたは指を差す側です"
      puts "----------------------------------------------------------"
      return "palyer_win"
    else
      puts "--------------------------------------------------------------"
      puts "じゃんけんは、あなたの負けです"
      puts "あっちむいてほいにうつります。敗者のあなたは指を差される側です"
      puts "--------------------------------------------------------------"
      return "player_lose"
    end
  end
end


puts "-----------------------------------"
puts "最初はグー。じゃんけん..."
puts "-----------------------------------"

# jankenメソッドを呼びだしたのち、返り値を変数janken_resultに格納する
janken_result = janken

# 「変数janken_resultが"aiko"の時のみ、jankenメソッド呼び出し、
# 返り値を変数janken_resultに格納する」という処理を繰り返す。
while janken_result == "aiko" do
  janken_result = janken
end

# atti-muite_hoiメソッドを定義する。
# 引数名はなんでもよい。今回は渡された引数の名前に合わせ、janken_resultとした。
def atti_muite_hoi(janken_result)
  puts "あっち向いて~"
  puts "-------------"
  
  choices = ["上", "下", "右", "左"]
  
  puts "[0]:上\n[1]:下\n[2]:右\n[3]：左"
  
  player_choice = choices[gets.to_i]
  cp_choice = choices[rand(3)]
  
  if janken_result == "player_win"
    puts "あなたは#{player_choice}を指差しました"
    puts "cpは#{cp_choice}を向きました"
    
      if player_choice == cp_chice
        puts "----------------------------------"
        puts "あなたの勝ちです"
        puts "さすがです！おめでとうございます！"
        puts "----------------------------------"
      else
        puts "--------------------------------------------------"
        puts "引き分けです"
        puts "爪が甘いです。最後まで直感を研ぎ澄ましてください！"
        puts "--------------------------------------------------"
      end
    
  elsif janken_result == "player_lose"
    puts "cpは#{cp_choice}を指さしました"
    puts "あなたは#{player_choice}を向きました"
      if cp_choice == player_choice
        puts "--------------------------------------"
        puts "あなたの負けです"
        puts "ニンゲンノ チョッカンナド コノテイドヨ"
        puts "--------------------------------------"
      else
        puts "-----------------------------"
        puts "引き分けです"
        puts "セーフ...危ないところでしたね"
        puts "-----------------------------"
      end
  end
end

# じゃんけんの勝敗が決まった時のみ、atti_muite_hoiメソッドを呼び出す。
# このメソッド外の情報をこのメソッド内の分岐条件に使用したいため、引数を渡す。
# 尚、今回はじゃんけんの勝敗情報（メソッド外の情報）が格納されている、ローカル変数janken_resultを引数に渡す。
if janken_result == "palyer_win" || janken_result == "player_lose"
  atti_muite_hoi(janken_result)
end
  

