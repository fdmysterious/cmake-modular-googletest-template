#This script is a wrapper for clang-tidy that output the logs in a log file. Output log file is set as the "TIDY_LOGS" env var.
touch "${TIDY_LOGS}" &&

# Read the config into a string
config_str=`cat $1`
shift

# The tricky part is to execute clang-tidy on file two times:
# - 1 time in quiet mode to have only errors in output clang-tidy.log file
# - 1 time in standard mode to have full statistics on general build log + return code.
clang-tidy --quiet --config="$config_str" $* >> "${TIDY_LOGS}"
clang-tidy --config="$config_str" $*
