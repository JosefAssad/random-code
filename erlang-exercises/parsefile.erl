-module(parsefile).
-author("Josef Assad").
-export([fetch_file/1]).

fetch_file(Filename) ->
    case file:open(Filename, read) of
	{ok, Fd} ->
	    assemble_lines([], [], Fd);
	{error, Reason} ->
	    Reason
    end.

split_on_spaces(String) ->
    pass.

assemble_lines(ListOfLines, Line, Fd) ->
    case Line of
	eof ->
	    ListOfLines;
	[] ->
	    NextLine = file:read_line(Fd),
	    assemble_lines(ListOfLines, NextLine, Fd);
	_ ->
	    {_, LineData} = Line,
	    NextLine = file:read_line(Fd),
	    assemble_lines(ListOfLines ++ [LineData -- "\n"], NextLine, Fd)
    end.
