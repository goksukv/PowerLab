set nokey
set title "Switching waveform (phase a)"
set xlabel "Time (sec)"
set ylabel "Switching Wave"
set yrange [-1:7]
plot "alo.txt" using 1:2 w l lw 1, \
"ahi.txt" using 1:2 w l lw 1
pause -1 "OK"

