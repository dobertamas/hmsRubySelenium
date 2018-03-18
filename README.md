
RUBY VERSION
============

The project was created using Ruby 2.3.1 version.

ABOUT THE CODE
==============

This is a proof of concept (POC) project, to show how Ruby's object-oriented features could be used
to create a test framework, along with Selenium, about HMS Admin console.

The implementation drives to provide a Page Object Model structure.
For this, a base page is being provided from which some general functions are being inherited,
for example the start and open methods.
Beside those, a couple of Selenium-related methods are there in the base class, to enable getting
webElements by type, to send keys, to click on webElements and so on.

LOCATORS
========

All locators are suggested to have inside HMSLogin/pages/locators.rb, by their related class for easier maintenance.

LOGGING
=======

For logging a custom logging class is being used. You might want to monitor the HMSLogin/log.txt file
to see the info and debug messages.
Regarding log levels: in general the methods in the base class will log events in debug mode
and the tests will use info level.

SENSITIVE_DATA
==============

The username/password is being stored in the utilities/test_data.txt file. Please do NOT commit it!
It is being read in the LoginPage class, utilizing the utilities/file_reader.rb file.

FURTHER TODO
============

Enable test run with Chrome browser.
