module ReadDBC

# Export functions 
export dbcTable, dbctodbf

# Importing packages 
using DBFTables
using DataFrames
using Logging
using Base.Libc.Libdl
using Base.Filesystem


# Defining function dbctodbf
function dbctodbf(input_file::String, output_file::String)
    # Set path for .dll files
    lib_path = "src/libdbc2dbf.dll"
    # Change permissions on the file before loading (optional and platform-dependent)
    chmod(lib_path, 0o755)

    # Load the shared library
    lib = dlopen(lib_path)
    
    # Ensure the library is properly loaded
    if lib === C_NULL
        error("Failed to load the library.")
    end

    # Create a pointer to the C function in the library
    func = dlsym(lib, :dbc2dbf)
    
    # Ensure the function pointer is valid
    if func === C_NULL
        dlclose(lib)
        error("Failed to find the function dbc2dbf in the library.")
    end

    # Call the C function directly with string parameters
    result = ccall(func, Cvoid, (Cstring, Cstring), input_file, output_file)

    # Close the library after the function call
    dlclose(lib)
    
    return result
end

# Defining function readdbc
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

end  # module readdbc
