## errorのハンドリングについて
```try catch (after)```を用いることで可能。基本的なsyntaxは```case```と同じ
```try catch```は```case```の豪華版とでも言えば良いらしい

## 発生しうるerrorのcaseと捕捉方法
- throw(val) -> throw:X;
- exit(val) -> exit:X;
- erlang:error(val) -> error:X.:w

## catchの単体使用
```catch```だけでも使えるっぽい

こういうことが出来る
```erlang
catch 1 + 1.
```
```erlang
8> catch 1 + "d".
{'EXIT',
    {badarith,
        [{erlang,'+',[1,"d"],[]},
         {erl_eval,do_apply,6,
             [{file,"erl_eval.erl"},
              {line,684}]},
         {erl_eval,expr,5,
             [{file,"erl_eval.erl"},
              {line,437}]},
         {shell,exprs,7,
             [{file,"shell.erl"},{line,686}]},
         {shell,eval_exprs,7,
             [{file,"shell.erl"},{line,642}]},
         {shell,eval_loop,3,
             [{file,"shell.erl"},
              {line,627}]}]}}
```
