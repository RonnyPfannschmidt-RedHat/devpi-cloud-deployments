================
devpi-cloud-deployments
================

There are python projects which need their own pypi for different reasons.
This project is set of templates for quick and easy devpi+nginx deployment in openshift.


Installation
------------

.. code-block:: bash

    # login to openshift
    oc login -u admin https://<some-ocp-server>:8443/

    # create project for devpi
    PROJ=devpi
    oc new-project ${PROJ}

    # create persistent volumes
    # 1. devpi-file-storage for storing package registry
    # 2. devpi-db-storage for db if postgre is used as metadata backend (currently not used)
    oc process -f devpi-pv-template.yaml -p NFS_HOST=<pv server> -p BASE_PATH=<some-path> | oc create -f -

    # NOTE: make sure $BASE_PATH/{files,db} already exist in NFS server

    # nginx image needs anyuid rights to work correctly
    # so, service account with anyuid rights has to be created
    oc adm policy add-scc-to-user anyuid system:serviceaccount:${PROJ}:devpi-nginx

    # rollout app
    oc process -f devpi-template.yaml -p NAME=${PROJ} -p FRONTEND_URL=devpi.apps.example.com | oc create -f -

    #TODO: use new-app instead

    # NOTE: if image building didn't start, it can be started by
    oc start-build bc/devpi
    oc logs -f bc/devpi

    # check that all pods
    oc get pods -w




Contributing
------------
- Fork
- Clone
- Create a branch in your repository for your feature or fix
- Write the code
- Push
- Create a pull request
