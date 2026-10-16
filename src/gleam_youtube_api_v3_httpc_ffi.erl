%% Thin wrapper around OTP's httpc for the example transport.
%% Everything crosses the boundary as binaries; httpc's charlists stay
%% inside this module.
-module(gleam_youtube_api_v3_httpc_ffi).
-export([request/5]).

request(MethodBin, UrlBin, Headers, ContentTypeBin, BodyBin) ->
    Method =
        case MethodBin of
            <<"get">> -> get;
            <<"post">> -> post;
            <<"put">> -> put;
            <<"delete">> -> delete
        end,
    Url = binary_to_list(UrlBin),
    Hs = [{binary_to_list(K), binary_to_list(V)} || {K, V} <- Headers],
    Req =
        case Method of
            get ->
                {Url, Hs};
            delete ->
                {Url, Hs};
            _ ->
                {Url, Hs, binary_to_list(ContentTypeBin), BodyBin}
        end,
    case httpc:request(Method, Req, [], []) of
        {ok, {{_, Status, _}, RespHs, RespBody}} ->
            {ok,
             {Status,
              [{list_to_binary(K), list_to_binary(V)} || {K, V} <- RespHs],
              iolist_to_binary(RespBody)}};
        {error, Reason} ->
            {error, list_to_binary(io_lib:format("~p", [Reason]))}
    end.
