
require 'glimmer-dsl-libui'
require 'ruby2d'



#set width: 300,height: 200
#s = Square.new
#s.color = 'red'
#show
=begin 

include Glimmer

sound = Sound.new('/Users/daruma/Downloads/irisu203/irisu203/data/bgm/irisu_05.mp3')

window('Progress Bar Example') {
  vertical_box {
    @progress_bar = progress_bar {
      stretchy false
      value 0 # 初期値を設定
    }
    
    @progress_start = false
    @minimum_value = 1
    @max_value = 100
    button("すたーと") {
      on_clicked do |button|
        unless @progress_start
          @progress_start = true
          p "on clicked!"
          sound.play
          Thread.new do
            file_count = 100 # ここでファイル数を設定
            value = @max_value/ file_count # ファイル数に応じて増加値を計算
            if value < @minimum_value or value == @minimum_value
                value = @minimum_value             
            end 
            loop do
              sleep 0.2 # 一定の待機時間
              unless @progress_bar.value >= 100
                @progress_bar.value += value
              else
                @progress_bar.value = 0 # プログレスバーをリセット
                @progress_start = false
                break # スレッドを終了
              end
            end
          end
        end
      end
    }
  }
}.show
=end
