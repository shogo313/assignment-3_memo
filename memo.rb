require "csv"

p "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
memo_type = gets.to_i 

if memo_type == 1
  p "新規作成するファイル名を入力してください(拡張子不要)"
  fileName = gets.chomp
  p "本文を入力してください(control+Dで保存)"
  CSV.open("#{fileName}.csv", 'w') do |csv|
    text = $stdin.read
    csv << [text] 
  end
elsif memo_type == 2
  p "編集するファイル名を入力してください(拡張子不要)"
  fileName = gets.chomp
  CSV.open("#{fileName}.csv", 'a') do |csv|
    p "本文への追記を入力してください(control+Dで保存)"
    text = $stdin.read
    csv << [text]
  end
end


