if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  " Use the same settings as C++ for CUDA files
  autocmd! BufRead,BufNewFile *.cu,*.cuh setfiletype cpp
augroup END
