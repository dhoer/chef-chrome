# X11 allows for visual GUI verification.
#
# The following link provides information about setting up x11 with vagrant:
# https://coderwall.com/p/ozhfva/run-graphical-programs-within-vagrantboxes
#
package 'xauth' unless platform?('windows', 'mac_os_x')
