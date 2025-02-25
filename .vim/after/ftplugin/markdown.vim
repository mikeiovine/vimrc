setlocal spell
command -buffer -range FormatTable <line1>,<line2> call text_helpers#FormatMarkdownTable()

