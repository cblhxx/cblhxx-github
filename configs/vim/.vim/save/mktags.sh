#!/bin/sh

echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > filenametags
#ctags -R --c++-kinds=+p --fields=+iaS --extra=+q 
find . -regex '.*\.\(cpp\|java\|h\|c\)' -type f -printf "%f\t%p\t1\n" | sort -f >> filenametags

#echo "!_TAG_FILE_SORTED    2   /2=foldcase/" > filenametags
#find . \( -name .svn -o -wholename ./classes \) -prune -o -not -iregex '.*\.\(jar\|gif\|jpg\|class\|exe\|dll\|pdd\|sw[op]\|xls\|doc\|pdf\|zip\|tar\|ico\|ear\|war\|dat\).*' -type f -printf "%f\t%p\t1\n" |sort -f >> ./filenametags

#ctags -R
#ctags -R --c++-kinds=+p --fields=+iaS --extra=+q 
#mkid -v -p "external/chromium/ external/webkit/ external/llvm/ external/icu4c/data/ external/icu4c/test/ vendor/qcom/proprietary/llvm-rs/" 
