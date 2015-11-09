# basic unit tests adapted from:
# http://www.johnmyleswhite.com/notebook/2010/08/17/unit-testing-in-r-the-bare-minimum/

library(RUnit)

source('cachematrix.R')

test.suite <- defineTestSuite(
    "test_cachematrix", dirs=file.path("tests"), testFileRegexp = '^\\d+\\.R')

test.result <- runTestSuite(test.suite)

printTextProtocol(test.result)
