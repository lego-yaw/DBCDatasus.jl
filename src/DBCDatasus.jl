module DBCDatasus

# Export functions 
export dbcTable, dbctodbf

# Importing packages 
using DBFTables
using DataFrames
using  DBCtoDBF_jll 



# Defining function dbctodbf
function dbctodbf(input_file::String, output_file::String)
    # The DBCtoDBF_jll package provides the dbc2dbf executable directly
    exe_path = dbc2dbf()  # This gives the path to the dbc2dbf executable

    # Run the executable with the input and output file arguments
    run(`$exe_path $input_file $output_file`)
    
    return output_file  # Optionally return the output file name
end

# Defining function DBCDatasus
function dbcTable(input_file::String)
    output_file = replace(input_file, ".dbc" => ".dbf")
    try
        # Convert the DBC file to a DBF file
        dbctodbf(input_file, output_file)
        
        # Read the DBF file into a DataFrame
        df = DBFTables.Table(output_file)
        return DataFrame(df)
        
    catch e
        @error "Failed to convert or read DBC file: $input_file"
        @error "$e"
        return nothing
    end
end

end  # module DBCDatasus
