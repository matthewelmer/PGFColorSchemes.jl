using PGFColorSchemes

for cscheme in [
    :tab10,  # The classic
    :managua10,
    :glasgow10,
    :hawaii10,
    :lipari10,
    :roma10,
    :Set2_8,
    :Set3_10,
    :Spectral,  # Beautiful
    :tableau_10,  # A nice variation on the classic
    :tableau_20,
    :Paired_12  # Half are great for dark plots, half are great for light plots
]
    generate_color_definitions(cscheme, "../generated_schemes")
end
