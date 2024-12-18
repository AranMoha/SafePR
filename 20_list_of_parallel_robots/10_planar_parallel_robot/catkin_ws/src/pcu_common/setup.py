## ! DO NOT MANUALLY INVOKE THIS setup.py, USE CATKIN INSTEAD

from distutils.core import setup
from catkin_pkg.python_setup import generate_distutils_setup


# fetch values from package.xml
setup_args = generate_distutils_setup(
    packages=['pcu_common_utils'],
    package_dir={'': 'src'},
)


setup(**setup_args)

