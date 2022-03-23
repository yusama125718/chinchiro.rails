class TopController < ApplicationController
  def index
  end
  def game
    @player = game(game_path)
    @deme = dice
    render template: "result/result1" and return
  end

  def game2
    judge(@deme)
    $yakuname = @pyakuname
    $yaku = $pyaku
    render template: "result/result2" and return
  end
end

def dice
  deme = []
  3.times do
    deme.push(rand(1..6))
  end
  deme.sort
  return deme
end

def judge(dice)
  case dice
  when [1,2,3]
    $yaku = 2.to_i
    $yakuname = "ヒフミ"
  when [1,2,2],[1,3,3],[1,4,4],[1,5,5],[1,6,6]
    $yaku = 3.to_i
    $yakuname = "イチ"
  when [1,1,2],[2,3,3],[2,4,4],[2,5,5],[2,6,6]
    $yaku = 4.to_i
    $yakuname = "二"
  when [1,1,3],[2,2,3],[3,4,4],[3,5,5],[3,6,6]
    $yaku = 5.to_i
    $yakuname = "サン"
  when [1,1,4],[2,2,4],[3,3,4],[4,5,5],[4,6,6]
    $yaku = 6.to_i
    $yakuname = "ヨン"
  when [1,1,5],[2,2,5],[3,3,5],[4,4,5],[5,6,6]
    $yaku = 7.to_i
    $yakuname = "ゴ"
  when [1,1,6],[2,2,6],[3,3,6],[4,4,6],[5,5,6]
    $yaku = 8.to_i
    $yakuname = "ロク"
  when [4,5,6]
    $yaku = 9.to_i
    $yakuname = "シゴロ"
  when [1,1,1]
    $yaku = 15.to_i
    $yakuname = "ピンゾロ"
  when [2,2,2]
    $yaku = 14.to_i
    $yakuname = "2のゾロ目"
  when [3,3,3]
    $yaku = 13.to_i
    $yakuname = "3のゾロ目"
  when [4,4,4]
    $yaku = 12.to_i
    $yakuname = "4のゾロ目"
  when [5,5,5]
    $yaku = 11.to_i
    $yakuname = "5のゾロ目"
  when [6,6,6]
    $yaku = 10.to_i
    $yakuname = "6のゾロ目"
  else
    $yaku = 1.to_i
    $yakuname = "役無し"
  end
end
