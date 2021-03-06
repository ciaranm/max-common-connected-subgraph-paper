# vim: set et ft=gnuplot sw=4 :

set terminal tikz color size 3.6in,2.8in standalone font '\scriptsize'
load "chromagreenblue.pal"

set output "gen-graph-unconnected-heatmap-unlabelled.tex"

set border 3
set lmargin 3
set rmargin 3

set title 'Unlabelled'

unset rmargin
set size square
set xlabel "FC Runtime (ms)"
set ylabel "Clique Runtime (ms)"
set x2range [0:100]
set y2range [0:100]
set xrange [1:3600e3]
set yrange [1:3600e3]
set logscale x
set logscale y
set logscale cb
set cbrange [1:1000]
unset ytics
set xtics nomirror add ('1' 1) add ('10' 10) add ('' 1000e3) add ('1h' 3600e3)
set ytics nomirror add ('1' 1) add ('10' 10) add ('' 1000e3) add ('1h' 3600e3)
set cbtics ('0' 1, '1' 2, '10' 10, '$10^2$' 1e2, '$\ge10^3$' 1e3)
set format x '$10^{%T}$'
set format y '$10^{%T}$'
set format cb '$10^{%T}$'
set tics front
load "chromagreenblue.pal"

plot \
    "../paper/unconnected-plain-heatmap.data" u 2:1:($3+1) matrix w image notitle axes x2y2, \
    x w l lc 'black' notitle axes x1y1

