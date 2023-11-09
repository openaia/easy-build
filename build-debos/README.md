build-yocto
===========

Building the Docker image
-------------------------

    $ docker build -t edgeble/build-debos build-debos

Running the Docker image
------------------------

    $ docker run -ti --privileged --net host --volume=<path/to/workspace>:/home/build/shared edgeble/build-debos

If you want to reflect your host ssh keys to container,

    $ docker run -ti --privileged --net host -v ~/.ssh:/home/build/.ssh --volume=<path/to/workspace>:/home/build/shared edgeble/build-debos
