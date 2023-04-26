if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  " Use the same settings as C++ for CUDA/Metal files
  autocmd! BufRead,BufNewFile *.cu,*.cuh,*.metal setfiletype cpp
augroup END
