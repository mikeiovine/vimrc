let g:loaded_text_helpers = 1

function s:StripLeadingTrailingWhitespace(s) abort
    return substitute(a:s, "^\\s\\+\\|\\s\\+$", "", "g")
endfunction

function s:CollectEntriesAndValidateTable(start, end) abort
    if a:end - a:start < 1
        echoerr "There must be at least two lines in the table."
        return []
    endif

    let rows = []
    let num_entries_per_row = -1
    for i in range(a:start, a:end)
        let line = s:StripLeadingTrailingWhitespace(getline(i))
        let row = split(line, "|")
        if num_entries_per_row == -1
            let num_entries_per_row = len(row)
        else
            if num_entries_per_row != len(row)
                echoerr "Invalid line, not enough table cols: " . getline(i)
                return []
            endif
        endif

        if i == a:start + 1
            for entry in row
                if match(entry, "\^\\s*----*\\s*\$") == -1
                    echoerr "Invalid second line: " . getline(i)
                    return []
                endif
            endfor
        endif
        call add(rows, row)
    endfor

    if num_entries_per_row == 0
        return []
    endif
    return rows
endfunction

function s:FormatRow(row, col_width) abort
    let new_row = "\|"
    for entry in a:row
        let entry_padded = entry . repeat(" ", a:col_width - len(entry))
        let new_row = new_row . " " . entry_padded . " \|"
    endfor
    return new_row
endfunction

function s:CreateSecondLine(num_cols, col_width) abort
    let entry = " " . repeat("-", a:col_width) . " \|"
    return "\|" . repeat(entry, a:num_cols)
endfunction

function text_helpers#FormatMarkdownTable() abort range
    let rows = s:CollectEntriesAndValidateTable(a:firstline, a:lastline)
    if len(rows) == 0
        return
    endif

    let new_rows = []

    " Width needs to be at least 3 for the second row.
    let col_width = 3
    for i in range(len(rows))
        let new_row = []
        for entry in rows[i]
            let new_entry = s:StripLeadingTrailingWhitespace(entry)
            call add(new_row, new_entry)
            if i != 1
                let col_width = max([col_width, len(new_entry)])
            endif
        endfor
        call add(new_rows, new_row)
    endfor

    for i in range(len(new_rows))
        if i != 1
            let new_line = s:FormatRow(new_rows[i], col_width)
        else
            let new_line = s:CreateSecondLine(len(new_rows[i]), col_width)
        endif
        call setline(i + a:firstline, new_line)
    endfor
endfunction

