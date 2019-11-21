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


