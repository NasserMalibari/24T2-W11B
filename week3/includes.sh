

for file in *.c # a.c b.c e.c
do
    echo "$file includes:"
    grep -E '^#include' "$file" |
    sed -E 's/#include\s*[<"]/    /' |
    sed -E 's/[">]$//'
    # echo $file
done