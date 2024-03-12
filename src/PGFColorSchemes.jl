module PGFColorSchemes
export generate_color_definitions, colorschemes

using ColorSchemes: colorschemes
using PGFPlotsX: TikzPicture, pgfsave, CUSTOM_PREAMBLE

function generate_color_definitions(cscheme::Symbol)
    empty!(CUSTOM_PREAMBLE)
    mkpath("generated_schemes")
    palette = colorschemes[cscheme]
    for i in 1:length(palette)
        push!(CUSTOM_PREAMBLE,
            "\\definecolor{$(string(cscheme))_$(i)}{rgb}{$(palette[i].r), " *
            "$(palette[i].g), $(palette[i].b)}"
        )
    end
    push!(CUSTOM_PREAMBLE,
        """\\pgfplotscreateplotcyclelist{$(string(cscheme))}{
        $(join(
            ["    {$(string(cscheme))_$i}" for i in 1:length(palette)],
            ",\n")
        )
        }"""
    )
    dummy_picture = TikzPicture()
    generated_scheme_path = "generated_schemes/$(string(cscheme)).tex"
    pgfsave(generated_scheme_path, dummy_picture)

    tmppath, tmpfile = mktemp()
    open(generated_scheme_path) do fin
        lines = readlines(fin, keep=true)[13:(end-4)]
        for line in lines
            write(tmpfile, line)
        end
    end
    close(tmpfile)
    mv(tmppath, generated_scheme_path, force=true)

    return nothing
end

end
