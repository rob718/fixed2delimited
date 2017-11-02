#!/usr/local/bin/gawk -f

# Gawk script to convert fixed-width SQL dump-style
# outputs to standard delimited (CSV-style) text files.

# Version 1.0 created 19-Mar-2010 by Rob D
# <https://github.com/rob718/fixed2delimited/>

#FS=Field separator
#RS=Record separator
#OFS=Original/source file record separator
BEGIN {
 FS=","
 RS="\n"
 OFS=","
}

# Determine fixed length positions by
# looking at second line of the file
NR==1{
 widthstring = (length($1)+1)
 for(i=2; i < NF; i++) {
    widthstring = widthstring " " (length($i)+1)
    if(i!=(NF-1))
     printf("%s",OFS ltrim(rtrim(rmlastcomma($i))))
 }
 i=NF-1
 print(OFS ltrim(rtrim(rmlastcomma($i))))
 FIELDWIDTHS = widthstring
}

# Now read from line 3 (i.e. skipping first two rows) using newly
# determined field lengths and remove whitespaces. Output
# each field separated by chosen delimiter.
NR>2{
 for(i=2; i < NF; i++)
    printf("%s",OFS ltrim(rtrim(rmlastcomma($i))))
 print(OFS ltrim(rtrim(rmlastcomma($NF))))
}

function ltrim(v) { gsub(/^[ ]+/, "", v); return v}
function rtrim(v) { gsub(/[ ]+$/, "", v); return v}
function rmlastcomma(v) { sub(/[,]+$/, "", v); return v}
