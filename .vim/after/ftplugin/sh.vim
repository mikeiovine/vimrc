" Very common options that most scripts will use.
" e -> halt script on error,
" u -> make undefined variables errors
" o pipefail -> make pipeline return code 1 if any
" failed, else 0.
iabbrev <buffer> optA set -eou pipefail

iabbrev <buffer> shA #!/bin/bash

call CreatePlaceholderAbbrev("ifA", "if [[ ___ ]]; then<CR>___<CR>fi")
call CreatePlaceholderAbbrev("ecA", "echo \"___\"")
