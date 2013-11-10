#!/bin/bash


if [ "$1" == "clear" ]; then
    rm -f filenametags cscope.* filelist tags tmpfile
    exit 0
fi




echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > filenametags
#ctags -R --c++-kinds=+p --fields=+iaS --extra=+q 
#find . -regex '.*\.\(cpp\|java\|h\|c\|hpp\)' -type f -printf "%f\t%p\t1\n" | sort -f >> tmpfile
#sed '/\s\.\/\(build\|cts\|dalvik\|development\|external\|ndk\|sdk\|prebuilts\)/d;' tmpfile > filenametags

find . \( -path ./out -o -path ./build -o -path ./cts -o -path ./dalvik -o -path ./development -o -path ./external -o -path ./ndk -o -path ./sdk -o -path ./prebuilts -o -type d -name ".?*" \) -prune -o \
    -regex '.*\.\(cpp\|java\|h\|c\|hpp\)' -type f -printf "%f\t%p\t1\n" >> filenametags


find . \( -path ./out -o -path ./build -o -path ./cts -o -path ./dalvik -o -path ./development -o -path ./external -o -path ./ndk -o -path ./sdk -o -path ./prebuilts -o -type d -name ".?*" \) -prune -o \
    -regex '.*\.\(cpp\|java\|h\|c\|hpp\)' -type f -print > filelist



#echo "!_TAG_FILE_SORTED    2   /2=foldcase/" > filenametags
#find . \( -name .svn -o -wholename ./classes \) -prune -o -not -iregex '.*\.\(jar\|gif\|jpg\|class\|exe\|dll\|pdd\|sw[op]\|xls\|doc\|pdf\|zip\|tar\|ico\|ear\|war\|dat\).*' -type f -printf "%f\t%p\t1\n" |sort -f >> ./filenametags
#find . \( -path ./build -o -path ./cts -o -path ./dalvik -o -path ./development -o -path ./external -o -path ./ndk -o -path ./sdk -o -path ./prebuilts -o -type d -name ".?*" \) -prune -o \
#    -name '*.c' -o -name '*.h' -o -name '*.cpp' -o -name '*.hpp' -o -name '*.java' | sort -f > filelist
#sed '/^\.\/\(build\|cts\|dalvik\|development\|external\|ndk\|sdk\|prebuilts\)/d;' tmpfile | sort -f > filelist
#ctags -R
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -L filelist
#mkid -v -p "external/chromium/ external/webkit/ external/llvm/ external/icu4c/data/ external/icu4c/test/ vendor/qcom/proprietary/llvm-rs/" 
#mkid -v

cscope -b -ifilelist

