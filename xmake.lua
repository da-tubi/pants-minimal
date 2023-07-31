add_requires("python 3.10")

target("python") do
    set_kind("phony")
    add_packages("python")

    on_install(function (target)
        local pkg = target:pkg("python")
        local pyenv_versions_dir = os.getenv("HOME") .. "/.pyenv/versions/"
        local pyenv_py_dir = pyenv_versions_dir .. pkg:version()
        if not os.exists(pyenv_versions_dir) then 
            os.mkdir(pyenv_versions_dir)
        end
        if os.exists(pyenv_py_dir) then
            os.rm(pyenv_py_dir)
        end
        os.ln(pkg:installdir(), pyenv_py_dir)

        print("Just installed Python " .. pkg:version() .. " to " .. pyenv_py_dir .. " ->")
        os.execv(pyenv_py_dir .. "/bin/python", {"-VV"})
    end)
end
