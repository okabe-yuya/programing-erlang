## 外部接続の方法

### Erlangっぽい
- 通常の多くの言語は外部言語との接続にアプリケーションの実行イメージをリンクできるようにして行うらしい
- Erlangでは外部のオペレーティングシステムプロセスとのやり取りはPortを通したmessage passingで行う

### 外部接続の方法
- ErlangのランタイムシステムにPortを解放したプロセスを生成して、そこでmessageを受ける
- サポートされているのは低レイヤーなバイナリーの送受のみ。これはErlangの堅牢性を保持するためにあえて、そのような設計になっている

### プログラムの設計
- .cや.pyで実行したい関数を実装しておく
- 対象の関数を呼び出すための、プロトコルを実装する(eg: 関数が2つ -> [1]A関数, [2]B関数)
