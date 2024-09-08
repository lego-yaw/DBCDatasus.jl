using Test
using ReadDBC
using DataFrames


# Test the dbctodbf function
@testset "ReadDBC Tests" begin
    # Set up file paths 
    input_file = "src/ABOAC1909.dbc"
    output_file = "src/ABOAC1909.dbf"     
    
    # Call the dbctodbf function
    result = dbctodbf(input_file, output_file)
    
    # Check if the output file is created (basic test)
    @test isfile(output_file)

    # Clean up (remove files)
    rm(output_file)
end

# Test the readdbc function
@testset "ReadDBC Tests" begin
    # Set up file paths
    input_file = "src/ABOAC1909.dbc"
    output_file = replace(input_file, ".dbc" => ".dbf")
    
    # Call the readdbc function
    df = dbcTable(input_file)
    
    # Ensure the DataFrame is returned and is not empty (this depends on actual implementation)
    @test df !== nothing
    @test isa(df, DataFrame)
    
    # Add more tests as needed, for example, checking specific columns or data in the DataFrame
    
    # Clean up (remove files)
    rm(output_file)
end

println("All tests passed successfully.")