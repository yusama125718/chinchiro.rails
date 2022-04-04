class TopController < ApplicationController
  def index
    @notice = session[:notice]
    reset_session
    flash[:system] = true
  end


  def dice
    deme = []
    3.times do
      deme.push(rand(1..6).to_i)
    end
    deme = deme.sort
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

  def check(wyaku)
    case wyaku
    when 3,4,5,6,7,8
      return 1
    when 10,11,12,13,14
      return 3
    else
      return 0
    end
  end

  def game
    if params[:p].length > 10
      session[:notice] = "名前は10文字以下にしてください"
      redirect_to "/"
      return
    elsif params[:p] == ""
      session[:notice] = "名前を入力してください"
      redirect_to "/"
      return
    end
    session[:roll] = 0
    session[:player] = params[:p]
    if session[:player] == nil
      redirect_to "/error"
      return
    end
    session[:pdeme] = dice
    session[:system] = 0
    redirect_to "/game/result1"
  end

  def game1
    if session[:system] != 0
      redirect_to "/error"
      return
    end
    session[:pdeme] = dice
    redirect_to "/game/result1"
  end

  def game2
    if session[:system] != 1
      redirect_to "/error"
      return
    end
    judge(session[:pdeme])
    session[:pyakuname] = $yakuname
    session[:pyaku] = $yaku
    session[:roll] += 1
    session[:system] = 2
    if session[:pyaku] == 1 && session[:roll] < 3
      redirect_to "/game/result20"
    else
      redirect_to "/game/result2"
    end
  end

  def game3
    if session[:system] != 3
      redirect_to "/error"
      return
    end
    session[:cdeme] = dice
    session[:system] = 4
    redirect_to "/game/result3"
  end

  def result1
    if session[:system] != 0
      redirect_to "/error"
      return
    end
    @deme = session[:pdeme]
    session[:system] = 1
  end

  def result2
    if session[:system] != 2
      redirect_to "/error"
      return
    end
    @deme = session[:pdeme]
    @pyakuname = session[:pyakuname]
    @player = session[:player]
    session[:roll] = 0
    session[:system] = 3
  end

  def result20
    if session[:system] != 2
      redirect_to "/error"
      return
    end
    @deme = session[:pdeme]
    @pyakuname = session[:pyakuname]
    @player = session[:player]
    @roll = session[:roll]
    session[:system] = 0
  end

  def result3
    if session[:system] != 4
      redirect_to "/error"
    end
    @player = session[:player]
    @deme = session[:cdeme]
    session[:system] = 5
  end

  def game4
    if session[:system] != 5
      redirect_to "/error"
      return
    end
    judge(session[:cdeme])
    session[:cyakuname] = $yakuname
    session[:cyaku] = $yaku
    session[:roll] += 1
    session[:system] = 6
    if session[:cyaku] == 1 && session[:roll] < 3
      redirect_to "/game/result40"
    else
      redirect_to "/game/result4"
    end
  end

  def result4
    if session[:system] != 6
      redirect_to "/error"
      return
    end
    @deme = session[:cdeme]
    @cyakuname = session[:cyakuname]
    @player = session[:player]
    session[:system] = 7
  end

  def result40
    if session[:system] != 6
      redirect_to "/error"
      return
    end
    @deme = session[:cdeme]
    @cyakuname = session[:cyakuname]
    @player = session[:player]
    @roll = session[:roll]
    session[:system] = 3
  end

  def finish
    if session[:system] != 7
      redirect_to "/error"
      return
    end
    @player = session[:player]
    @pyakuname = session[:pyakuname]
    @pdeme = session[:pdeme]
    @cdeme = session[:cdeme]
    @cyakuname = session[:cyakuname]
    case session[:pyaku]
    when 2
      @winner = "子(#{session[:player]})"
      @vakue = 2
      return
    when 9
      @winner = "親(CPU)"
      @value =2
      return
    when 15
      @winner = "親(CPU)"
      @value = 5
      return
    end
    case session[:cyaku]
    when 2
      @winner = "親(CPU)"
      @value = 2
      return
    when 9
      @winner = "子(#{session[:player]})"
      @value =2
      return
    when 15
      @winner = "子(#{session[:player]})"
      @value = 5
      return
    end
    if session[:cyaku] > session[:pyaku]
      @winner = "子(#{session[:player]})"
      @value = check(session[:cyaku])
    elsif session[:cyaku] == session[:pyaku]
      @winner = "引き分け"
      @value = "-"
    elsif session[:cyaku] < session[:pyaku]
      @winner = "親(CPU)"
      @value = check(session[:pyaku])
    end
  end
end
