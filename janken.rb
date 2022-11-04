#janken メソッドを定義する
def janken
  choices = ["グー", "チョキ", "パー", "戦わない"]
  
  puts "[0]:グー\n[1]:チョキ\n[2]:パー\n[3]:戦わない"
  
  # ユーザの入力を数値に変換
  # Integerを使用している理由は、不正な値（nillや数値に変換できない文字列）の場合エラーを返し、処理を中断してくれるから。
  # to_iメソッドを使用すると、不正な値でも無理矢理、数値に変換する。nil.to_i => 0 , "a".to_i => 0 など。 
  select_number = Integer(gets.chomp!)
  player_choice = choices[select_number]
  
  cp_choice = choices[rand(3)]
  
  #player_choiceがwhenの右の値の時だけ、処理を実行する
  case player_choice
  when "戦わない"
    puts "-----------------------------------"
    puts "ニンゲントハ オクビョウナ モノダナ"
    puts "-----------------------------------"
    
    return "abstention"
  when "グー", "チョキ", "パー"
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
      return "player_win"
    else
      puts "--------------------------------------------------------------"
      puts "じゃんけんは、あなたの負けです"
      puts "あっちむいてほいにうつります。敗者のあなたは指を差される側です"
      puts "--------------------------------------------------------------"
      return "player_lose"
    end
  else
    return "error"
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
  
  select_number = Integer(gets.chomp!)

  player_choice = choices[select_number]
  
  cp_choice = choices[rand(3)]
  
  #player_choiceがwhenの右の値の時だけ、処理を実行する
  case player_choice
  when "上", "下", "右", "左"
  
    if janken_result == "player_win"
      puts "あなたは#{player_choice}を指差しました"
      puts "cpは#{cp_choice}を向きました"
      
        if player_choice == cp_choice
          puts "----------------------------------"
          puts "あなたの勝ちです"
          puts "さすがです！おめでとうございます！"
          puts "----------------------------------"
        else
          puts "--------------------------------------------------------"
          puts "引き分けです"
          puts "爪が甘いです。最後まで直感を研ぎ澄ましてください！"
          puts "勝敗がつくまで、じゃんけんからやり直しです"
          puts "--------------------------------------------------------"
          puts "最初はグー。じゃんけん..."
          puts "-----------------------------------"
          
          return "drow"
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
          puts "------------------------------------------"
          puts "引き分けです"
          puts "セーフ...危ないところでしたね。"
          puts "しかし、安心するのはまだ早いですよ"
          puts "勝敗がつくまで、じゃんけんからやり直しです"
          puts "------------------------------------------"
          puts "最初はグー。じゃんけん..."
          puts "-----------------------------------"
          
          return "drow"
        end
    end
    
  else 
    return "error"
  end
end

# じゃんけんの勝敗が決まった時のみ、atti_muite_hoiメソッドを呼び出し、返り値を、変数atti_muite_hoi_result に格納する。
# また、このメソッド外の情報をこのメソッド内の分岐条件に使用したいため、引数を渡す。
# 尚、今回はじゃんけんの勝敗情報（メソッド外の情報）が格納されている、ローカル変数janken_resultを引数に渡す。
if (janken_result == "player_win") || (janken_result == "player_lose")
  atti_muite_hoi_result = atti_muite_hoi(janken_result)
end

# 「あっちむいてほいの結果が、引き分けになったとき、じゃんけん〜あっちむいてほいの結果を変数に格納するとこまで、やり直し」
# という操作を繰り返す。つまり、あっちむいてほいの結果が引き分け以外になるまで、延々とじゃんけんからやり直し。

while atti_muite_hoi_result == "drow" do
  
  # もし、じゃんけんやあっちむいてホイで、0~3以外の入力があった。
  # もしくは、プレイヤーがじゃんけんを棄権した時、繰り返しを終了する。
  if (atti_muite_hoi_result == "error") || (janken_result == "error") || (janken_result == "abstention")
    break
  end
  
  # やりなおし部分の処理
  janken_result = janken
  while janken_result == "aiko" do
    janken_result = janken
  end
  
  if (janken_result == "player_win") || (janken_result == "player_lose")
 
    atti_muite_hoi_result = atti_muite_hoi(janken_result)

  end
  # やり直し部分の処理終了
end

