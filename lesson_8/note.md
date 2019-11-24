## Erlangでの並行プログラミング入門
基本的にElixirでのspawn(func), receive, sendとやることは同じ

- spawn(fun foo/0) % ここがarityを指定して渡すことに注意
- receiveにはtimeoutを指定することが可能 -> after
```erlang
receive
    {From, resp} -> nice,
after
    {From, resp} -> void,
```

- send ! {self(), {nice "boat"}

