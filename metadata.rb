name             'ephemeral_lvm'
maintainer       'RightScale, Inc.'
maintainer_email 'cookbooks@rightscale.com'
license          'Apache 2.0'
description      'Configures available ephemeral devices on a cloud server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.13'

supports 'ubuntu'
supports 'centos'
supports 'debian'

depends 'lvm', '~> 1.6.1'

recipe "ephemeral_lvm::default", "Sets up ephemeral devices on a cloud server"

attribute "ephemeral_lvm/filesystem",
  :display_name => "Ephemeral LVM Filesystem",
  :description =>
    "The filesystem to be used on the ephemeral volume." +
    " Defaults are based on OS and determined in attributes/defaults.rb.",
  :recipes => ["ephemeral_lvm::default"],
  :required => "recommended"

attribute "ephemeral_lvm/mount_point",
  :display_name => "Ephemeral LVM Mount Point",
  :description => "The mount point for the ephemeral volume",
  :default => "/mnt/ephemeral",
  :recipes => ["ephemeral_lvm::default"],
  :required => "recommended"

attribute "ephemeral_lvm/mount_point_properties",
  :display_name => "Ephemeral LVM Mount Properties",
  :description => "The options used when mounting the ephemeral volume",
  :default => {:options => ["defaults", "noauto"], :pass => 0},
  :recipes => ["ephemeral_lvm::default"],
  :required => "optional"

attribute "ephemeral_lvm/volume_group_name",
  :display_name => "Ephemeral LVM Volume Group Name",
  :description => "The volume group name for the ephemeral LVM",
  :default => "vg-data",
  :recipes => ["ephemeral_lvm::default"],
  :required => "optional"

attribute "ephemeral_lvm/logical_volume_size",
  :display_name => "Ephemeral LVM Logical Volume Size",
  :description => "The size to be used for the ephemeral LVM",
  :default => "100%VG",
  :recipes => ["ephemeral_lvm::default"],
  :required => "optional"

attribute "ephemeral_lvm/logical_volume_name",
  :display_name => "Ephemeral LVM Logical Volume Name",
  :description => "The name of the logical volume for ephemeral LVM",
  :default => "ephemeral0",
  :recipes => ["ephemeral_lvm::default"],
  :required => "optional"

attribute "ephemeral_lvm/stripe_size",
  :display_name => "Ephemeral LVM Stripe Size",
  :description => "The stripe size to be used for the ephemeral logical volume",
  :default => "512",
  :recipes => ["ephemeral_lvm::default"],
  :required => "optional"
