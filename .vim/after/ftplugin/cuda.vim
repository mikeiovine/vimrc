" Source all C++ ftplugins.
"
" Vim's default CUDA plugin does this already, so
" this might be a bit redundant. It's probably best to
" not rely on this though as it's not documented and
" doesn't happen on older versions of vim.
runtime after/ftplugin/cpp.vim

iabbrev <buffer> glA __global__
iabbrev <buffer> deA __device__
