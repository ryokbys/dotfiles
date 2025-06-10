set term qt font "Sans,22"

set linetype 1 lc rgb "#0072bd" lw 2.5 pt 5
set linetype 2 lc rgb "#d95319" lw 2.5 pt 7
set linetype 3 lc rgb "#edb120" lw 2.5 pt 9
set linetype 4 lc rgb "#7e2f8e" lw 2.5 pt 11
set linetype 5 lc rgb "#77ac30" lw 2.5 pt 1 pi -1
set linetype 6 lc rgb "#4dbeee" lw 2.5 pt 2 pi -1
set linetype 7 lc rgb "#a2142f" lw 2.5 pt 3 pi -1
set linetype 8 lc rgb "#1481d6" lw 2.5 pt 4 pi -1
# set style line linestyle cycle 8
set linetype cycle 8

# xy border
set style line 101 lt 1 lw 2 lc rgb "#000000"
set border 15 front ls 101
#set border 3 front ls 101
set tics nomirror out scale 1
set format '%g'

# set tics font "Sans,18" textcolor rgb "#606060"
# set xlabel font "Sans,18" textcolor rgb "#606060"
# set ylabel font "Sans,18" textcolor rgb "#606060"
# set key font "Sans,18" textcolor rgb "#606060"
