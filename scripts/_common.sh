#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

YNH_PHP_VERSION="7.3"

pkg_dependencies="apt-transport-https postgresql postgresql-contrib php${YNH_PHP_VERSION}-zip php${YNH_PHP_VERSION}-pgsql php${YNH_PHP_VERSION}-xml php${YNH_PHP_VERSION}-intl php${YNH_PHP_VERSION}-mbstring php${YNH_PHP_VERSION}-gd php${YNH_PHP_VERSION}-curl php${YNH_PHP_VERSION}-bcmath php${YNH_PHP_VERSION}-opcache php${YNH_PHP_VERSION}-sqlite3 php${YNH_PHP_VERSION}-ldap"

#=================================================
# PERSONAL HELPERS
#=================================================

# Assign two variables:
#   minutes: random value between 00 and 59 (MM)
#   hour: random value between 0 and 2
# It is used for the cronjob, so that it runs every 3 hours starting at 00:MM, 01:MM, or 02:MM.
generate_random_minutes_hour () {
	minutes="$(ynh_string_random --length=1 --filter=0-5)$(ynh_string_random --length=1 --filter=0-9)"
	hour="$(ynh_string_random --length=1 --filter=0-2)"
	ynh_app_setting_set --app=$app --key=minutes --value=$minutes
	ynh_app_setting_set --app=$app --key=hour --value=$hour
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

# Check available space before creating a temp directory.
#
# usage: ynh_smart_mktemp --min_size="Min size"
#
# | arg: -s, --min_size= - Minimal size needed for the temporary directory, in Mb
ynh_smart_mktemp () {
        # Declare an array to define the options of this helper.
        declare -Ar args_array=( [s]=min_size= )
        local min_size
        # Manage arguments with getopts
        ynh_handle_getopts_args "$@"

        min_size="${min_size:-300}"
        # Transform the minimum size from megabytes to kilobytes
        min_size=$(( $min_size * 1024 ))

        # Check if there's enough free space in a directory
        is_there_enough_space () {
                local free_space=$(df --output=avail "$1" | sed 1d)
                test $free_space -ge $min_size
        }

        if is_there_enough_space /tmp; then
                local tmpdir=/tmp
        elif is_there_enough_space /var; then
                local tmpdir=/var
        elif is_there_enough_space /; then
                local tmpdir=/
        elif is_there_enough_space /home; then
                local tmpdir=/home
        else
                ynh_die "Insufficient free space to continue..."
        fi

        echo "$(mktemp --directory --tmpdir="$tmpdir")"
}

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
