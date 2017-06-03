#!/bin/bash
#
# @name shellmage
# @package tools
# @subpackage magento
# @author Ralph Dittrich <LupusCoding@gmail.com
#

shellmage() {
    case $1 in
        create)
			if [ $# -ne 3 ];then
				echo "missing namespace/modulename"
				exit 1
			fi
			# create application folder
			echo "creating application folders"
			command mkdir -p app/code/community/$2/$3
			command mkdir app/code/community/$2/$3/Block
			command mkdir app/code/community/$2/$3/controllers
			command mkdir app/code/community/$2/$3/etc
			command mkdir app/code/community/$2/$3/Helper
			command mkdir app/code/community/$2/$3/Model
			command mkdir app/code/community/$2/$3/sql
			# create design folder
			echo "creating design folders"
			command mkdir -p app/design/base/default/layout
			command mkdir -p app/design/base/default/locale
			command mkdir -p app/design/base/default/template
			# create configuration folder
			echo "creating configuration folders"
			command mkdir -p app/etc/modules
			command touch app/etc/modules/$2_$3.xml
			# prefill configuration file
			echo "prefill configuration file at app/etc/modules"
			echo '<?xml version="1.0"?>' > app/etc/modules/$2_$3.xml
			echo '' >> app/etc/modules/$2_$3.xml
			echo '<config>' >> app/etc/modules/$2_$3.xml
			echo '  <modules>' >> app/etc/modules/$2_$3.xml
			echo "    <$2_$3>" >> app/etc/modules/$2_$3.xml
			echo '      <active>true</active>' >> app/etc/modules/$2_$3.xml
			echo '      <codepool>community</codepool>' >> app/etc/modules/$2_$3.xml
			echo "    </$2_$3>" >> app/etc/modules/$2_$3.xml
			echo '  </modules>' >> app/etc/modules/$2_$3.xml
			echo '</config>' >> app/etc/modules/$2_$3.xml
            # create skin folder
            echo "creating skin folders"
            command mkdir -p skin/adminhtml/default/default
            command mkdir -p skin/frontend/base/default
            command mkdir skin/frontend/base/default/css
            command mkdir skin/frontend/base/default/js
            ;;
        *)
			echo "usage shellmage OPTIONS [parameter]"
			;;
	esac
}