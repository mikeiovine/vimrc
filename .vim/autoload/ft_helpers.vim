" Helper functions related to filetype detection

" Used by header detect autocmd in filetype.vim
function ft_helpers#TryDetectCUDA(max_num_lines) abort
    let lines = getline(1, min([line("$"), a:max_num_lines]))
    if match(lines, "\\(__global__\\)\\|\\(__device__\\)") != -1
        setfiletype cuda
    endif
endfunction

