## ファイルのコンパイル方法について
- ```erl```でshellからerlプロンプトを立ち上げる
- 対象のファイルがあるpathまで```cd```で移動する
- > 1> c(geometry). # 指定しているmodule名をc()に代入
- 同じpath内のディレクトリに```.beam```ファイルが生成される

## 読み込んだmoduleの使用方法について
- > 2> geometory.関数名(argas).

## sample
```
❯  erl
Erlang/OTP 21 [erts-10.2.3] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

Eshell V10.2.3  (abort with ^G)
1> c(geometry).
{ok,geometry}
2> geometry:area({rectangle, 10, 5}).
50
3> geometry:area({circle, 1.4}).
6.157516399999999
```

## Erlangのファイルに記述するもの
```erlang
-module(file). % モジュールに対する命名。基本的にファイル名と同じで良いのかな?
-export([func/1]). % 外部から使用したい関数を列挙(リストなのでおそらく複数記述出来る) /Nは引数の数
- import(module_name, [func/1, func/2]
- include(file_path) % ```.hrl```ファイル等(defined in record)をimportする際に使用

somefunc([]) -> 0; % 同名の関数(アリティの数も同じ)をまだ記述する場合には```;```を使用
somefunc([H|T]) -> somefunc(T). % 終了を宣言する```.```を使用
``

## 内包表記
syntaxについて
```erlang
% L = [1,2,3,4,5]
[X * 2 || X <- L]
````i

generatorを使ってfilterを行う場合
```erlang
[X || X <- L, X > 3]
```

## 演算子
equal -> A =:= B

## record
goでのstructのようなもの
.hrlファイルに定義できる模様でgoのstructのように更新が可能(default値も設定出来る)
```erlang
-record(todo, {status=online, who=okb, message})
```

```erlang
% init record
X = #{todo}.

% update record
X1 = X#todo{status=offline}.

% pattern match
#todo{status=S, who=W} = X1.

% dot operator
X1#todo.status.
```

## 条件式
**case**
```erlang
case P(H) of
    true -> __;
    false -> __
end;
```

**if**
```erlang
if 
    pattern1 -> __;
    pattern2 -> __;
    __ -> __
end;
```
