# coding: utf-8
require "opengl"
require "glu"
require "glut"

# セグメントの形状
WSIZE=800 # ウインドウサイズ
SEG_S = 0.1 # 短辺
SEG_L = 0.3 # 長辺
X = -SEG_S-0.5*SEG_L # x軸上の座標調整
Y = 1.5*SEG_S+SEG_L  # y軸上の座標調整

# セグメント描画メソッド(セグメントa~g)
GL.Color(1.0,1.0,0.0)

def draw_segment_a # 上
  GL.Begin(GL::POLYGON)
  GL.Vertex(X+SEG_S,Y)
  GL.Vertex(X+SEG_S,Y-SEG_S)
  GL.Vertex(X+SEG_S+SEG_L,Y-SEG_S)
  GL.Vertex(X+SEG_S+SEG_L,Y)
  GL.End()
end

def draw_segment_b # 左上
  GL.Begin(GL::POLYGON)
  GL.Vertex(X,Y-SEG_S)
  GL.Vertex(X,Y-SEG_S-SEG_L)
  GL.Vertex(X+SEG_S,Y-SEG_S-SEG_L)
  GL.Vertex(X+SEG_S,Y-SEG_S)
  GL.End()
end

def draw_segment_c # 左下
  GL.Begin(GL::POLYGON)
  GL.Vertex(X,Y-2*SEG_S-SEG_L)
  GL.Vertex(X,Y-2*SEG_S-SEG_L-SEG_L)
  GL.Vertex(X+SEG_S,Y-2*SEG_S-SEG_L-SEG_L)
  GL.Vertex(X+SEG_S,Y-2*SEG_S-SEG_L)
  GL.End()
end

def draw_segment_d # 下
  GL.Begin(GL::POLYGON)
  GL.Vertex(X+SEG_S,Y-2*SEG_S-2*SEG_L)
  GL.Vertex(X+SEG_S,Y-2*SEG_S-2*SEG_L-SEG_S)
  GL.Vertex(X+SEG_S+SEG_L,Y-2*SEG_S-2*SEG_L-SEG_S)
  GL.Vertex(X+SEG_S+SEG_L,Y-2*SEG_S-2*SEG_L)
  GL.End()
end

def draw_segment_e # 右下
  GL.Begin(GL::POLYGON)
  GL.Vertex(X+SEG_S+SEG_L,Y-2*SEG_S-SEG_L)
  GL.Vertex(X+SEG_S+SEG_L,Y-2*SEG_S-SEG_L-SEG_L)
  GL.Vertex(X+SEG_S+SEG_L+SEG_S,Y-2*SEG_S-SEG_L-SEG_L)
  GL.Vertex(X+SEG_S+SEG_L+SEG_S,Y-2*SEG_S-SEG_L)
  GL.End()
end

def draw_segment_f # 右上
  GL.Begin(GL::POLYGON)
  GL.Vertex(X+SEG_S+SEG_L,Y-SEG_S)
  GL.Vertex(X+SEG_S+SEG_L,Y-SEG_S-SEG_L)
  GL.Vertex(X+SEG_S+SEG_L+SEG_S,Y-SEG_S-SEG_L)
  GL.Vertex(X+SEG_S+SEG_L+SEG_S,Y-SEG_S)
  GL.End()
end

def draw_segment_g # 中
  GL.Begin(GL::POLYGON)
  GL.Vertex(X+SEG_S,Y-SEG_S-SEG_L)
  GL.Vertex(X+SEG_S,Y-SEG_S-SEG_L-SEG_S)
  GL.Vertex(X+SEG_S+SEG_L,Y-SEG_S-SEG_L-SEG_S)
  GL.Vertex(X+SEG_S+SEG_L,Y-SEG_S-SEG_L)
  GL.End()
end

## カウント変数
__count = 0

### 描画コールバック ########
display = Proc.new {

  GL.Clear(GL::COLOR_BUFFER_BIT) # 画面のクリア

  ## カウンターを描く
  if __count == 0
    ### 0を描画
    draw_segment_a
    draw_segment_b
    draw_segment_c
    draw_segment_d
    draw_segment_e
    draw_segment_f
  elsif __count == 1
    ### 1
    draw_segment_e
    draw_segment_f
  elsif __count == 2
    ### 2
    draw_segment_a
    draw_segment_c
    draw_segment_d
    draw_segment_f
    draw_segment_g
  elsif __count == 3
    ### 3
    draw_segment_a
    draw_segment_d
    draw_segment_e
    draw_segment_f
    draw_segment_g
  elsif __count == 4
    ### 4
    draw_segment_b
    draw_segment_e
    draw_segment_f
    draw_segment_g
  elsif __count == 5
    ### 5
    draw_segment_a
    draw_segment_b
    draw_segment_d
    draw_segment_e
    draw_segment_g
  elsif __count == 6
    ### 6
    draw_segment_a
    draw_segment_b
    draw_segment_c
    draw_segment_d
    draw_segment_e
    draw_segment_g
  elsif __count == 7
    ### 7
    draw_segment_a
    draw_segment_b
    draw_segment_e
    draw_segment_f
    ### 7
  elsif __count == 8
    ### 8
    draw_segment_a
    draw_segment_b
    draw_segment_c
    draw_segment_d
    draw_segment_e
    draw_segment_f
    draw_segment_g
  elsif __count == 9
    ### 9
    draw_segment_a
    draw_segment_b
    draw_segment_d
    draw_segment_e
    draw_segment_f
    draw_segment_g
  end

  GL.Flush()
}

### キーボード入力コールバック ########
keyboard = Proc.new { |key,x,y|

  if key == '0'
    __count = 0
    GLUT.PostRedisplay()
  elsif key == '1'
    __count = 1
    GLUT.PostRedisplay()
  elsif key == '2'
    __count = 2
    GLUT.PostRedisplay()
  elsif key == '3'
    __count = 3
    GLUT.PostRedisplay()
  elsif key == '4'
    __count = 4
    GLUT.PostRedisplay()
  elsif key == '5'
    __count = 5
    GLUT.PostRedisplay()
  elsif key == '6'
    __count = 6
    GLUT.PostRedisplay()
  elsif key == '7'
    __count = 7
    GLUT.PostRedisplay()
  elsif key == '8'
    __count = 8
    GLUT.PostRedisplay()
  elsif key == '9'
    __count = 9
    GLUT.PostRedisplay()
  elsif key == 'q' or key.ord == ox1b
    exit 0
  end
}

### 特殊キーボード入力コールバック ########
special = Proc.new { |key,x,y|

  if key == GLUT::KEY_LEFT or key == GLUT::KEY_UP
    __count = (__count + 1) % 10
    GLUT.PostRedisplay()
  elsif key == GLUT::KEY_RIGHT or key == GLUT::KEY_DOWN
     __count = (__count - 1) % 10
    GLUT.PostRedisplay()
  end
}

#### マウス入力コールバック ########
mouse = Proc.new{ |button,state,x,y|
  if button == GLUT::LEFT_BUTTON and state == GLUT::DOWN
    __count = (__count + 1) % 10
    GLUT.PostRedisplay()
  elsif button == GLUT::RIGHT_BUTTON and state == GLUT::DOWN
    __count = (__count - 1) % 10
    GLUT.PostRedisplay()
  end

}

#### ウインドウサイズ変更コールバック ########
reshape = Proc.new {  |w,h|
  GL.Viewport(0,0,w,h)
  GL.LoadIdentity()
  x=w.to_f/WSIZE  # w.to_f: 整数を浮動小数点数に変換
  y=h.to_f/WSIZE  # h.to_f: 整数を浮動小数点数に変換
  GLU.Ortho2D(-x,x,-y,y)
  __y = y         # 状態変数の更新
  GLUT.PostRedisplay()
}

####################################
# main
####################################
GLUT.Init()                         # OpenGLの初期化
GLUT.InitWindowSize(WSIZE,WSIZE)    # ウインドウサイズ
GLUT.CreateWindow("Counter")        # ウインドウタイトル
GLUT.DisplayFunc(display)           # 描画コールバックの登録
GLUT.KeyboardFunc(keyboard)         # キーボード入力コールバックの登録
GLUT.SpecialFunc(special)           # 特殊キー用のキーボード入力コールバックの登録
GLUT.MouseFunc(mouse)               # マウス入力コールバックの登録
GLUT.ReshapeFunc(reshape)           # ウインドウサイズ変更コールバック登録
GL.ClearColor(0.4,0.4,1.0,1.0)      # 背景色の設定
GLUT.MainLoop()
