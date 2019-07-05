#! /bin/bash
docker-compose up -d
printf "export LC_ALL=en_US.UTF-8\nexport LANG=en_US.UTF-8" >> .env
# create the notebook directory
#NBDIR=data
NBDIR2=output
#mkdir "$NBDIR"
mkdir "$NBDIR2"
# make it owned by the GID, in osx it is staff.
#chown :100 "$NBDIR"
#chown :staff "$NBDIR"
chown :staff "$NBDIR2"
# make it group-setgid-writable
#chmod g+rws "$NBDIR"
chmod g+rws "$NBDIR2"
# set the default permissions for new files to group-writable
#setfacl -d -m g::rwx "$NBDIR"
#setfacl -d -m g::rwx "$NBDIR2"
docker container exec notebook_container-ds_global_internship sh -c 'apt-get update -qq && \
apt-get install -qqy --no-install-recommends git wget && \
pip --no-cache-dir install -U pip && \
pip --no-cache-dir install -U pipenv && \
pip --no-cache-dir install -U Cython && \
pip --no-cache-dir install -U click && \
pip --no-cache-dir install -U Sphinx && \
pip --no-cache-dir install -U coverage && \
pip --no-cache-dir install -U awscli && \
pip --no-cache-dir install -U flake8 && \
pip --no-cache-dir install -U statsmodels && \
pip --no-cache-dir install -U scipy && \
pip --no-cache-dir install -U seaborn && \
pip --no-cache-dir install -U matplotlib && \
pip --no-cache-dir install -U kshape && \
pip --no-cache-dir install -U pyyaml && \
pip --no-cache-dir install -U pandas && \
pip --no-cache-dir install -U numpy && \
pip --no-cache-dir install -U tsfresh && \
pip --no-cache-dir install -U pyflux && \
pip --no-cache-dir install -U python-dotenv && \
pip --no-cache-dir install -U catboost && \
pip --no-cache-dir install -U xgboost && \
pip --no-cache-dir install -U tqdm && \
pip --no-cache-dir install -U http://download.pytorch.org/whl/cpu/torch-0.4.1-cp36-cp36m-linux_x86_64.whl && \
pip --no-cache-dir install -U torchvision && \
pip --no-cache-dir install git+https://github.com/scikit-learn/scikit-learn.git && \
pip --no-cache-dir install git+https://github.com/tgsmith61591/pyramid.git && \
pip --no-cache-dir install git+https://github.com/networkx/networkx.git && \
pip --no-cache-dir install numba && \
pip --no-cache-dir install joblib && \
pip --no-cache-dir install git+https://github.com/rtavenar/tslearn.git
'




