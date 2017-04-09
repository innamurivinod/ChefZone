name 'final'
maintainer 'Bethala Suresh'
maintainer_email 'bethalasuresh@gmail.com'
license 'all_rights'
description 'Installs/Configures final'
long_description 'Installs/Configures final in multi node setup'
version '1.0.1'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
  issues_url 'https://github.com/sureshishan/ChefZone/final/issues' if respond_to?(:issues_url)

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
  source_url 'https://github.com/sureshishan/ChefZone/final' if respond_to?(:source_url)

depends 'mysql', '= 8.2.0'