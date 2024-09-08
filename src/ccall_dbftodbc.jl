using DBCtoDBF_jll  # Load the DBCtoDBF_jll wrapper

function dbctodbf(input_file::String, output_file::String)
    # The DBCtoDBF_jll package provides the dbc2dbf executable directly
    exe_path = dbc2dbf()  # This gives the path to the dbc2dbf executable

    # Run the executable with the input and output file arguments
    run(`$exe_path $input_file $output_file`)
    
    return output_file  # Optionally return the output file name
end

# Example usage
input_file = "src/ABOAC1909.dbc"
output_file = "src/ABOAC1909.dbf"
dbctodbf(input_file, output_file)