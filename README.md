# Minimal template project for Python projects using Pants

This is a minimal template project using Pants:
+ No subproject
+ Only one fixed set of python dependencies
+ With IDE support

For demo project with multiple subprojects and dependencies sets, see [pants-pyspark](https://github.com/da-tubi/pants-pyspark).

## How to run?
```
./pants run hello.py
```

## Dependency Management
In this template project, there is only one resolve (a set of python dependencies) called `python-default`.

And we add `pandas==1.2.4` as an example dependency in [BUILD.pants](BUILD.pants)

Do not forgot to generate the lockfile ([3rdparty/python/default.lock](3rdparty/python/default.lock)) for you own projects.
```
./pants generate-lockfiles
```

## VSCode/PyCharm Integration
```
./pants export ::
```

The specific python version might be `3.8.14` or others.
```
Wrote virtualenv for the resolve 'python-default' (using Python 3.8.15) to dist/export/python/virtualenvs/python-default
```

Here is the Python interpreter generated by the above export command:
```
dist/export/python/virtualenvs/python-default/3.8.15/bin/python
```

For VSCode, a sample [.vscode/settings.json](.vscode/settings.json) with Python `3.8.15` is prepared for you.

For PyCharm, please click `PyCharm -> Preferences... -> Project: pants-minimal -> Python Interpreter` to add the existing `Virtualenv Environment` and then select it.
