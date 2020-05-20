# Autogenerated wrapper script for MariaDB_Connector_ODBC_jll for x86_64-apple-darwin14
export libmaodbc

using iODBC_jll
using Libiconv_jll
using unixODBC_jll
using OpenSSL_jll
using Zlib_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "DYLD_FALLBACK_LIBRARY_PATH"
LIBPATH_default = "~/lib:/usr/local/lib:/lib:/usr/lib"

# Relative path to `libmaodbc`
const libmaodbc_splitpath = ["lib", "libmaodbc.dylib"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libmaodbc_path = ""

# libmaodbc-specific global declaration
# This will be filled out by __init__()
libmaodbc_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libmaodbc = "@rpath/libmaodbc.dylib"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"MariaDB_Connector_ODBC")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (iODBC_jll.PATH_list, Libiconv_jll.PATH_list, unixODBC_jll.PATH_list, OpenSSL_jll.PATH_list, Zlib_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (iODBC_jll.LIBPATH_list, Libiconv_jll.LIBPATH_list, unixODBC_jll.LIBPATH_list, OpenSSL_jll.LIBPATH_list, Zlib_jll.LIBPATH_list,))

    global libmaodbc_path = normpath(joinpath(artifact_dir, libmaodbc_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libmaodbc_handle = dlopen(libmaodbc_path)
    push!(LIBPATH_list, dirname(libmaodbc_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

