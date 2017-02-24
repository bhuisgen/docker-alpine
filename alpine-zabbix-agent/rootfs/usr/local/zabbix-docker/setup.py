import io
import os
import re

try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup

def read(*names, **kwargs):
    with io.open(
        os.path.join(os.path.dirname(__file__), *names),
        encoding=kwargs.get("encoding", "utf8")
    ) as fp:
        return fp.read()

def find_version(*file_paths):
    version_file = read(*file_paths)
    version_match = re.search(r"^__version__ = ['\"]([^'\"]*)['\"]",
                              version_file, re.M)
    if version_match:
        return version_match.group(1)
    raise RuntimeError("Unable to find version string.")

config = {
    "name": "zabbix-docker",
    "version": find_version("zabbix-docker", "version.py"),
    "description": "docker monitoring for zabbix",
    "author": "Boris HUISGEN",
    "author_email": "bhuisgen@hbis.fr",
    "url": "https://github.com/bhuisgen/zabbix-docker",
    "download_url": "https://github.com/bhuisgen/zabbix-docker",
    "packages": ["zabbix-docker"],
    "scripts": [],
    "install_requires": ["docker-py", "py-zabbix"]
}

setup(**config)
