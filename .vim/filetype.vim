if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  " Use the same settings as C++ for CUDA/Metal files.
  " Also make vim recognize module interface files for C++20
  autocmd! BufRead,BufNewFile *.cu,*.cuh,*.metal,*.cppm setfiletype cpp
augroup END
