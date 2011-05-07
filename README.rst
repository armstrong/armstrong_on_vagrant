Armstrong on Vagrant
====================
This repository is the eventual home of the configuration scripts for running
the Armstrong platform inside a Vagrant environment.

Not much to see here currently.


Getting Started
---------------

Install the Vagrant gem and VirtualBox.  Once installed, clone this repository
and run ``git submodules update --init`` to pull in the required submodules.

Once the repository is setup, you should be able to run ``vagrant up`` to bring
up the VM.


What this provides
------------------

Eventually it will provide an entire working Armstrong environment.  Currently,
it simply sets up Python and installs the fork of Fabric that we're relying on.


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
