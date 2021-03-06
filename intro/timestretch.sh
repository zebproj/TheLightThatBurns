sr=$1
size=$2
overlap=$3
stretch=$4
file=$5
file_form=\'\"$file\"\'
outfile=$6
extratime=$7
echo "pvanal -s $sr -c 1 -n $size -w $overlap -K  $file out.pvx"
pvanal -s $sr -c 1 -n $size -w $overlap -K  $file out.pvx

echo "csound \
--omacro:FILE=\'\"$file\"\' 
--omacro:STRETCH=$stretch \
-o$outfile \
TimeStretcher.csd"

csound \
--omacro:FILE=$file_form \
--omacro:STRETCH=$stretch \
--omacro:EXTRA=$extratime \
-o$outfile \
TimeStretcher.csd
