import("private.action.require.impl.package")

function install_python(python_version)
    -- https://github.com/xmake-io/xmake-repo/blob/master/packages/p/python/xmake.lua
    local PYTHON_VERSION = python_version
    local PYTHON_PKG = "python "..PYTHON_VERSION
    local PYENV_VERSIONS = os.getenv("HOME") .. "/.pyenv/versions/"
    local PYTHON_DIR = PYENV_VERSIONS .. PYTHON_VERSION
    local PYTHON_BIN = PYTHON_DIR .. "/bin/python"
    
    xrepo_cmd = string.format("xrepo install 'python %s'", PYTHON_VERSION)
    print("Run: "..xrepo_cmd)
    os.exec(xrepo_cmd)
    pkgs = package.load_packages(PYTHON_PKG)
    for _, pkg in ipairs(pkgs) do 
        if pkg:name() == "python" then
            os.mkdir(PYENV_VERSIONS)
            os.rm(PYTHON_DIR)
            os.ln(pkg:installdir(), PYTHON_DIR)
            print("Run: "..PYTHON_BIN.." --version")
            os.execv(PYTHON_BIN, {"--version"})
        end
    end
end

function main(python_version)
    if python_version == nil then
        print("Please provide a Python version")
        print("eg. xmake l python 3.10.11")
    else
        install_python(python_version)
    end
end
