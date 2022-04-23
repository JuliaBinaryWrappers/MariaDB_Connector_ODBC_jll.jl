# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule MariaDB_Connector_ODBC_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("MariaDB_Connector_ODBC")
JLLWrappers.@generate_main_file("MariaDB_Connector_ODBC", UUID("1124d457-72a3-5205-9757-36a127c7d0f8"))
end  # module MariaDB_Connector_ODBC_jll
