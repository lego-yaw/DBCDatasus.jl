#using Libdl
using Base.Filesystem
using Base.Libc.Libdl

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