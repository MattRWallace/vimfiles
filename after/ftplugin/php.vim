" Setup PHP only formating
setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4

set errorformat+="%f"\\,%l\\,%c\\,%t%*[a-zA-Z]\\,"%m"
command! Phpcs execute RunPhpcs()

au BufWritePost :call RunPhpcs() <CR>
