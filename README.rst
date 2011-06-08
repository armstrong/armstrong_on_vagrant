Armstrong on Vagrant
====================
This repository gets you started with a `Vagrant`_ box for testing and
evaluating `Armstrong`_.

.. warning:: This is meant for development and should not be used in
             production.  Period.


Getting Started
---------------

TL;DR
"""""

::

    gem install vagrant
    git clone git://github.com/armstrongcms/armstrong_on_vagrant.git
    cd armstrong_on_vagrant
    git submodule update --init
    vagrant up


Slightly Longer
"""""""""""""""

Install the Vagrant gem and VirtualBox.  Once installed, clone this repository
and run ``git submodules update --init`` to pull in the required submodules.

Once the repository is setup, you should be able to run ``vagrant up`` to bring
up the VM.  Note, this does download a ~500mb "box", so it will probably take a
few minutes.


What is provided
----------------
This currently provides the basics for the development version of Armstrong.
This does *not* build the box, that's been done for you and saved.  The box
this installs is already setup with Armstrong and a development server.

The VM that is booted has Django running using the ``runserver_plus`` command
from `django-extensions`_.  It uses a few custom scripts with ``upstarts`` to
automatically start the server as soon as it has booted and Vagrant has mounted
the NFS file system.

The ``./armstrong`` directory in this repository is mounted in
``/sites/armstrong`` in the VM via NFS (network file system).  Any changes you
make to the configuration, templates, and so on, are automatically mirrored
inside the VM and ``runserver_plus`` will reload the changes.

.. _django-extensions: http://packages.python.org/django-extensions/


Questions
---------

Why doesn't this build the Armstrong environment?
    From a simplicity standpoint, we don't need it to.  From a technical
    standpoint, pip and puppet don't play nicely with namespace packages.  For
    some reason, pip dies while trying to install ``armstrong`` throw puppet,
    but not directly from the command line.

    This issue has been reported to pip (`#298`_) and we'll adjust as
    necessary.

.. _#298: https://github.com/pypa/pip/issues/298


What's with that ``.rvmrc`` file?
    Vagrant is a Ruby tool and `rvm`_ is a way to separate out different
    versions of Ruby and different sets of Gems (Ruby packages).  It's like
    `virtualenv`_ plus `virtualenvwrapper`_.

    The ``.rvmrc`` file is used by rvm to automatically start a particular
    environment.  Creating a ``1.8.7@armstrong`` gemset (like its own
    virtualenv) in rvm is an easy way to segregate all of the
    armstrong_on_vagrant dependencies.

    If you're not using rvm, this file doesn't effect you.

.. _rvm: https://rvm.beginrescueend.com/
.. _virtualenv: http://www.virtualenv.org/
.. _virtualenvwrapper: http://www.doughellmann.com/projects/virtualenvwrapper/



State of Project
----------------
Armstrong is an open-source news platform that is freely available to any
organization.  It is the result of a collaboration between the `Texas Tribune`_
and `Bay Citizen`_, and a grant from the `John S. and James L. Knight
Foundation`_.  The first release is scheduled for June, 2011.

To follow development, be sure to join the `Google Group`_.


License
-------
Copyright 2011 Bay Citizen and Texas Tribune

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


.. _Armstrong: http://www.armstrongcms.org/
.. _Bay Citizen: http://www.baycitizen.org/
.. _John S. and James L. Knight Foundation: http://www.knightfoundation.org/
.. _Texas Tribune: http://www.texastribune.org/
.. _Google Group: http://groups.google.com/group/armstrongcms
.. _Vagrant: http://vagrantup.com/
