try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup

config = {
    "name": "zabbix-docker",
    "version": "0.1",
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
