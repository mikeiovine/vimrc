" These settings are also applied to CUDA files
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

" Note that this is the default in newer versions of vim
setlocal commentstring=//\ %s

call CreatePlaceholderAbbrev("main", "int main(){_}")
call CreatePlaceholderAbbrev("fl", "for (auto _ : _) {_}")
call CreatePlaceholderAbbrev("pr", "std::cout << _ << std::endl;")
