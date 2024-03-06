using PGFColorSchemes

for cscheme in [:tab10, :managua10, :glasgow10, :hawaii10, :lipari10, :roma10, :Set2_8, :Set3_10, :Spectral, :tableau_10, :tableau_20]
    generate_color_definitions(cscheme)
end
