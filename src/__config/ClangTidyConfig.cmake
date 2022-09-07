set(CLANG_TIDY_CHECKS_LIST
    "cppcoreguidelines-*"                    # Enable core cpp guidelines checks
    "bugprone-*"                             # Enable bugprone checks
    "readability-*"                          # Enable readability checks
    "hicpp-*"                                # Enable high integrity CPP checks
)


set(CLANG_TIDY_ERRORS_LIST
    "*"                                      # All enabled checks can trigger an error
    "-cppcoreguidelines-avoid-magic-numbers" # Disable magic number error
    "-readability-magic-numbers"             # --
)


#####################################################################

string(REPLACE ";" "," CLANG_TIDY_CHECKS "${CLANG_TIDY_CHECKS_LIST}")
string(REPLACE ";" "," CLANG_TIDY_ERRORS "${CLANG_TIDY_ERRORS_LIST}")

message(STATUS "Clang TIDY checks: ${CLANG_TIDY_CHECKS}")
message(STATUS "Clang TIDY errors: ${CLANG_TIDY_ERRORS}")

set(CMAKE_C_CLANG_TIDY
    /bin/ash;
    $ENV{BUILD_PWD}/scripts/tidy.sh;
    ${PROJECT_SOURCE_DIR}/__config/clang-tidy-config.yml;
    --header-filter=.;
    --checks=${CLANG_TIDY_CHECKS};
    --warnings-as-errors=${CLANG_TIDY_ERRORS};
)
