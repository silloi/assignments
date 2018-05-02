# coding: utf-8
=begin

所属:人間・環境学研究科
氏名:西山雄大
学生番号:6030-29-7763

=end

require "opengl"
require "glu"
require "glut"
require "cg/mglutils"

WSIZE=600 # ウインドウサイズ
W = 0.1
LEFT = -4*W

# 描画処理
display = Proc.new {
  GL.Clear(GL::COLOR_BUFFER_BIT)  # 背景のクリア
  GL.Color(1.0,0.0,0.0)
  GL.Begin(GL::QUADS)

  y0 = 5.2*W; y1 = y0-W           # 1画目
    x0 = LEFT+W; x1 = x0+2*W
    GL.Color(1.0,0.0,0,0)
    GL.Vertex(x0,y0); GL.Vertex(x0,y1); GL.Vertex(x1,y1); GL.Vertex(x1,y0)

    y0 = 4*W; y1 = y0-W           # 2画目
    x0 = LEFT; x1 = x0+4*W
    GL.Color(1.0,0.0,0,0)
    GL.Vertex(x0,y0); GL.Vertex(x0,y1); GL.Vertex(x1,y1); GL.Vertex(x1,y0)
  GL.End()

  MGLUtils.disc([LEFT+2*W,2*W],1.8*W) #3画目外円

  GL.Color(0.0,0.0,0.0)
  MGLUtils.disc([LEFT+2*W,2*W],W) #3画目内円

  GL.Color(0.0,1.0,0.0)
  GL.Begin(GL::QUADS)
    y0 = 5.2*W; y1 = y0-5*W       #4画目
    x0 = LEFT+6*W; x1 = x0+W
    GL.Vertex(x0,y0); GL.Vertex(x0,y1); GL.Vertex(x1,y1); GL.Vertex(x1,y0)

    y0 = 3*W; y1 = y0-W          #5画目
    x0 = x0+W; x1 = x0+1.5*W
    GL.Vertex(x0,y0); GL.Vertex(x0,y1); GL.Vertex(x1,y1); GL.Vertex(x1,y0)

    y0 = 0; y1 = y0-3*W          #6画目の1
    x0 = LEFT+W; x1 = x0+W
    GL.Color(0.0,0.0,1.0)
    GL.Vertex(x0,y0); GL.Vertex(x0,y1); GL.Vertex(x1,y1); GL.Vertex(x1,y0)

    y0 = -2*W; y1 = y1           #6画目の2
    x0 = x0; x1 = x0+6*W
    GL.Vertex(x0,y0); GL.Vertex(x0,y1); GL.Vertex(x1,y1); GL.Vertex(x1,y0)
    
  GL.End()
  GL.Flush() # 描画強制実行
}

keyboard = Proc.new { |key,x,y|
  exit 0                         # 何かキーが押されたらプログラム終了
}

GLUT.Init()                      # 初期化処理
GLUT.InitWindowSize(WSIZE,WSIZE) # ウインドウの大きさの指定
GLUT.CreateWindow("TITLE")       # ウインドウの作成
GLUT.DisplayFunc(display)        # 描画コールバック登録
GLUT.KeyboardFunc(keyboard)      # キーボード入力コールバック登録
GL.ClearColor(0.0,0.0,0.0,1.0)   # 背景色を設定
GLUT.MainLoop()                  # イベントループ開始
