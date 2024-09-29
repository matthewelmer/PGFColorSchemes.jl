module PGFColorSchemes
export generate_color_definitions, colorschemes

using ColorSchemes: colorschemes

function generate_color_definitions(cscheme::Symbol)
    mkpath("generated_schemes")
    generated_scheme_path = joinpath("generated_schemes", "$(string(cscheme)).tex")
    palette = colorschemes[cscheme]
    fout = open(generated_scheme_path, "w")
    for ii in 1:length(palette)
        write(fout, "\\definecolor{$(string(cscheme))_$(ii)}{rgb}{$(palette[ii].r), $(palette[ii].g), $(palette[ii].b)}\n")
    end
    write(fout, "\\pgfplotscreateplotcyclelist{$(string(cscheme))}{\n")
    for ii in 1:length(palette)
        write(fout, "    {$(string(cscheme))_$ii}\n")
    end
    write(fout, "}\n")

    return
end

end
