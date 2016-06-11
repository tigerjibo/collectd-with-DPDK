collectd Plugin for Fuel
================================

collectd plugin
-----------------------

Overview
--------

Fuel plugin fuel-plugin-collectd is developed to deploy collectd with DPDK

Requirements
------------

| Requirement                      | Version/Comment |
|----------------------------------|-----------------|
| Mirantis OpenStack compatibility | 9.0             |

Recommendations
---------------

None.

Limitations
-----------

None.

Installation Guide
==================

collectd plugin installation
----------------------------------------

1. Clone the fuel-plugin-collectd repo from stackforge:

        git clone https://github.com/maryamtahhan/collectd-with-DPDK

2. Install the Fuel Plugin Builder:

        pip install fuel-plugin-builder

3. Build collectd Fuel plugin:

        fpb --build fuel-plugin/

4. The *fuel-plugin-collectd-[x.x.x].rpm* plugin package will be created in the plugin folder.

5. Move this file to the Fuel Master node with secure copy (scp):

        scp fuel-plugin-collectd-[x.x.x].rpm root@<the_Fuel_Master_node_IP address>:/tmp

6. While logged in Fuel Master install the collectd plugin:

        fuel plugins --install fuel-plugin-collectd-[x.x.x].rpm

7. Check if the plugin was installed successfully:

        fuel plugins

        id | name                 | version | package_version
        ---|----------------------|---------|----------------
        1  | fuel-plugin-collectd | 0.9.0   | 4.0.0

8. Plugin is ready to use and can be enabled on the Settings tab of the Fuel web UI.


User Guide
==========

collectd plugin configuration
---------------------------------------------

1. Create a new environment with the Fuel UI wizard.
2. Click on the Settings tab of the Fuel web UI.
3. Scroll down the page, select the plugin checkbox.


Build options
-------------

It is possible to modify process of building plugin by setting environment variables. Look into [pre_build_hook file](pre_build_hook) for more details.

Dependencies
------------

If you plan to use plugin in environment without internet access or/and CentOS environment modify build command:

     INCLUDE_DEPENDENCIES=true fpb --build fuel-plugin-collectd/

Pre build script will try download required dependencies so it become part of the compiled plugin.

Note: List of packages for [ubuntu](collectd_package/ubuntu/dependencies.txt) and [centos](collectd_package/centos/dependencies.txt) may need to be modified if packages in centos or ubuntu repositories will change.

Testing
-------

None.

Known issues
------------

None.


Development
===========

The *OpenStack Development Mailing List* is the preferred way to communicate,
emails should be sent to `openstack-dev@lists.openstack.org` with the subject
prefixed by `[fuel][plugins][collectd]`.

Reporting Bugs
--------------

Bugs should be filled on the [Launchpad fuel-plugins project](
https://bugs.launchpad.net/fuel-plugins) (not GitHub) with the tag `collectd`.


Contributing
------------

If you would like to contribute to the development of this Fuel plugin you must
follow the [OpenStack development workflow](
http://docs.openstack.org/infra/manual/developers.html#development-workflow).

Patch reviews take place on the [OpenStack gerrit](
https://review.openstack.org/#/q/status:open+project:stackforge/fuel-plugin-collectd,n,z)
system.

Contributors
------------

* ruijing.guo@intel.com
