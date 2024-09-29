PGFColorSchemes.jl
==================

Generates preamble code for your tex file that defines the colors and a `plotcyclelist` for a given color scheme from [ColorSchemes.jl](https://juliagraphics.github.io/ColorSchemes.jl/stable/catalogue/).

For example, if you wanted the classic `tab10`
![tab10 color scheme](image.png)
color scheme, you would call
```julia
generate_color_definitions(:tab10)
```
to generate a file `generated_schemes/tab10.tex` containing
```tex
\definecolor{tab10_1}{rgb}{0.1216, 0.4667, 0.7059}
\definecolor{tab10_2}{rgb}{1.0, 0.498, 0.0549}
\definecolor{tab10_3}{rgb}{0.1725, 0.6275, 0.1725}
\definecolor{tab10_4}{rgb}{0.8392, 0.1529, 0.1569}
\definecolor{tab10_5}{rgb}{0.5804, 0.4039, 0.7412}
\definecolor{tab10_6}{rgb}{0.549, 0.3373, 0.2941}
\definecolor{tab10_7}{rgb}{0.8902, 0.4667, 0.7608}
\definecolor{tab10_8}{rgb}{0.498, 0.498, 0.498}
\definecolor{tab10_9}{rgb}{0.7373, 0.7412, 0.1333}
\definecolor{tab10_10}{rgb}{0.0902, 0.7451, 0.8118}
\pgfplotscreateplotcyclelist{tab10}{
    {tab10_1}
    {tab10_2}
    {tab10_3}
    {tab10_4}
    {tab10_5}
    {tab10_6}
    {tab10_7}
    {tab10_8}
    {tab10_9}
    {tab10_10}
}
```
which can be `\input`ed into your preamble or simply copy-pasted.
