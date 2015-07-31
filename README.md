ExSample
=====

Sample application for Elixir. See the related Elixir article: http://blog.eood.cn/elixir

Parallelize processing input JSON String and counting the total processing speed.

    mix compile.protocols
    iex --erl '+K true +A 32 +P 10000000' --sname w -pa _build/dev/consolidated -S mix run

Will show:

    TPS: 213869
    TPS: 213153
    TPS: 224197
    TPS: 219426
    TPS: 212906
    TPS: 221791
    ...

Other useful commands:

    ./entop w@Bruces-iMac --sname m
    :observer.start()
