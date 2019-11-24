## ファイルのコンパイル方法
### Erlangシェルでコンパイル
```erlang
$ erl
$ c(hello).
$ hello:start().
Hello World
```

### コマンドプロンプトからコンパイル
```sh
$ erlc hello.erl % filepathを指定
$ erl -noshell -s hello start -s init stop
Hello World
```

-noshell -> shellを起動せずに実行(shell scriptの内部でErlangの実行結果を扱うことが可能に)
-s はいくつでも指定することが可能

### escriptからの実行
```hello
#!/usr/bin/env escript

erlang function...
```

```shell
$ chmod u+x hello
$ ./hello
Hello World
```

## コマンドラインから引数を受け取る
```shell
$ erlc fac1.erl
$ erl -noshell -s fac1 main 25
factorial 25 = 15511...........
```

## Makefileからmoduleをcompileする
Makefileにcompileする旨を記述していく。基本的にはshellと同じで変数用意して、command叩くみたいな感じ
baseはprograming erlangのjoe先生のmakefileを参考にすれば良いかと

試しにmakefileを作ってcompileしてみたが出来た(makefile_sampleを参照)

## helpの見方
```erlang
$ erl -man init
```

## 組み込みコマンドを扱う
```user_default.erl```というファイルを設定して、そこに使用したい関数を列挙する

```erlang
1> c(user_default)
2> hello().
"Hello World"
```
