if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  " Use the same settings as C++ for Metal files.
  " Also make vim recognize module interface files for C++20
  autocmd! BufRead,BufNewFile *.metal,*.cppm setfiletype cpp

  " CUDA header files are supposed to be identified by using
  " the .cuh extension. Unfortunately, it's pretty common
  " for CUDA developers to use .h. This function will
  " check for keywords like __device__, __global__, etc.
  " We'll detect CUDA if we find any of these special strings.
  autocmd! BufRead,BufNewFile *.h call ft_helpers#TryDetectCUDA(200)
augroup END
