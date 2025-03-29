" This is the default list excep that I've removed `ghc`. The reason is that I
" usually use stack to build my projects. `ghc` will give errors when there
" are no problems because it's not aware of the stack project configuration.
" TODO: set up YCM for Haskell
let b:ale_linters = ['cabal_ghc', 'cspell', 'ghc_mod', 'hdevtools', 'hie', 'hlint', 'hls', 'stack_build', 'stack_ghc']

