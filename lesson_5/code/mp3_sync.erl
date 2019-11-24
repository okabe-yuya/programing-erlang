-module(msp3_sync).
-export([decode_header/1]).

% MPEGのheaderの同期フレームを確認する
decode_header(<<2#11111111111:11, B:2, C:2, _D:1, E:4, F:2, G:1, Bits:9>>) ->
    Vsn = case B of
              0 -> {2, 5};
              1 -> exit(badVsn);
              2 -> 2;
              3 -> 1
          end,
    Layer = case C of
                0 -> exit(badLayer);
                1 -> 3;
                2 -> 2;
                3 -> 1
            end,

    BitRate = bitrate(Vsn, Layer, E) * 1000,
    SampleRate = samplerate(Vsn, F),
    Padding = G,
    FrameLength = framelength(Layer, BitRate, SampleRate, Padding),
    if
        FrameLength < 21 -> exit(frameSize);
        true -> {ok, FrameLength, {Layer, BitRate, SampleRate, Vsn, Bits})
    end;

decode_header(_) -> exit(badHeader).
