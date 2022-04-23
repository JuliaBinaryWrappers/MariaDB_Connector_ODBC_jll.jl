# Autogenerated wrapper script for MariaDB_Connector_ODBC_jll for x86_64-linux-gnu
export libmaodbc

using iODBC_jll
using Libiconv_jll
using unixODBC_jll
using OpenSSL_jll
using Zlib_jll
JLLWrappers.@generate_wrapper_header("MariaDB_Connector_ODBC")
JLLWrappers.@declare_library_product(libmaodbc, "libmaodbc.so")
function __init__()
    JLLWrappers.@generate_init_header(iODBC_jll, Libiconv_jll, unixODBC_jll, OpenSSL_jll, Zlib_jll)
    JLLWrappers.@init_library_product(
        libmaodbc,
        "lib/mariadb/libmaodbc.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
