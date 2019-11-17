## binary操作

- <<2#11111111 -> 二進数で指定桁数分だけ取得
- B:2 -> 2byte分を取得して変数Bに格納(binary pattern match)
- <<MainBits:32>> -> こういうことやね

## attributes for module infomation
- module
- export などのそれ

-ModuleInfo("my name is okb") % 好きな情報を付与できる

確認方法
```erlang
1> c(module_name).
2> module_name:module_info()
[{module,attrs},
 {exports,[{fac,1},
           {module_info,0},
           {module_info,1}]},
 {attributes,[{vsn,[1.23]},
              {author,[{okb,nice_man}]},
              {purpose,[{"example"}]}]},
 {compile,[{version,"7.3.1"},
           {options,[]},
           {source,"/Users/okabeyuuya/programing-erlang/lesson_5/code/attrs.erl"}]},
 {native,false},
 {md5,<<206,189,170,36,103,236,83,182,14,45,
        135,93,102,1,177,185>>}]
```

## erlangのマクロ
よくわからんが、defineでセットしたものを上書きするようなイメージ??
カリー関数を触っているような感じ

```erlang
-define(macro(X, Y), {a, X, Y}).

% macroを更新(プリプロセッサによって評価)
foo(A) -> ?macro(A + 10, b)
```

生成される関数(return: {atom, integer, atom})
```erlang
foo(A) -> {a, A+10, b}
```

## 変わった演算子
- equal? A =:= B (A == Bは浮動小数点を同一か確認したい時だけ使う)
- not equal? A =/= B





