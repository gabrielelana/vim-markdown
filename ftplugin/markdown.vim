if exists("b:did_ftplugin")
  finish
endif

setlocal comments=b:*,b:-,b:+
setlocal formatoptions+=tcrqon formatoptions-=wa

let b:did_ftplugin = 1
