title: Lettuce
name: inverse
layout: true
class: center, middle, inverse
---

#Lettuce

Lord Junior 6th
Gregory Eric Sanderson Turcot Temlett MacDonnell of Glengary Forbes of Linden

---
layout: false

What is Lettuce ?
=================

 * BDD framework
 * Similar to Cucumber for ruby
 * Tests are written in ".feature" files
 * Steps are implemented in "steps.py"

---

Your first Scenario
====================

    Feature: Compute factorial
        In order to show how Lettuce works
        As a programmer
        We shall implement a factorial method

        Scenario: Factorial of 0
            Given I have the number "0"
            When I compute its factorial
            Then I see the number "1"

---

Save the file
=============

    tests
    └── features
        ├── factorial.feature
        ├── __init__.py
        ├── steps.py


---

Run lettuce
===========

Command:

    lettuce factorial.feature

Result:

    # -*- coding: utf-8 -*-
    from lettuce import step

    @step(u'Given I have the number "([^"]*)"')
    def given_i_have_the_number_group1(step, group1):
        assert False, 'This step must be implemented'
    @step(u'When I compute its factorial')
    def when_i_compute_its_factorial(step):
        assert False, 'This step must be implemented'
    @step(u'Then I see the number "([^"]*)"')
    def then_i_see_the_number_group1(step, group1):
        assert False, 'This step must be implemented'


---

Write steps
===========

    from lettuce import step, world

    @step(u'Given I have the number "([^"]*)"')
    def given_i_have_the_number_group1(step, number):
        world.number = int(number)

    @step(u'When I compute its factorial')
    def when_i_compute_its_factorial(step):
        world.factorial = compute_factorial(world.number)

    @step(u'Then I see the number "([^"]*)"')
    def then_i_see_the_number_group1(step, number):
        number = int(number)
        error_msg = "Got %d, expected %d" % (world.factorial, number)
        assert world.factorial == number, error_msg


---

Watch it fail
=============

Command:

    lettuce factorial.feature

Output:

    Scenario: Factorial of 0                # factorial.feature:6
        Given I have the number "0"         # steps.py:6
        When I compute its factorial        # steps.py:11
        Traceback (most recent call last):
            File "/usr/lib/python2.7/site-packages/lettuce/core.py", line 144, in __call__
                ret = self.function(self.step, *args, **kw)
            File "/home/gregory/pyqc/pyqc-lettuce/tests/features/steps.py", line 12, in when_i_compute_its_factorial
                world.factorial = compute_factorial(world.number)
        NameError: global name 'compute_factorial' is not defined
        Then I see the number "1"           # steps.py:16

---

Make it pass
============

    def compute_factorial(number):
        return 1

---

Run again
=========

    Scenario: Factorial of 0                # factorial.feature:6
        Given I have the number "0"         # steps.py:6
        When I compute its factorial        # steps.py:11
        Then I see the number "1"           # steps.py:16

    1 feature (1 passed)
    1 scenario (1 passed)
    3 steps (3 passed)

---

Write another test
==================

    Scenario: Factorial of 1
        Given I have the number "1"
        When I compute its factorial
        Then I see the number "1"

    Scenario: Factorial of 4
        Given I have the number "4"
        When I compute its factorial
        Then I see the number "24"

---

Make it pass
============

    def compute_factorial(number):
        if (number == 0) or (number == 1):
            return 1
        else:
            return number * compute_factorial(number - 1)

---

Don't Repeat Yourself
=====================

    Scenario Outline: Factorials from 0 to 4
        Given I have the number "<number>"
        When I compute its factorial
        Then I see the number "<result>"

    Examples:
        | number | result |
        | 0      | 1      |
        | 1      | 1      |
        | 2      | 2      |
        | 3      | 6      |
        | 4      | 24     |

---

Little Bobby Tables
===================

    Scenario: Convert contacts to csv
        Given I have the following contacts:
            | title     | first name | last name | ship                    |
            | Captain   | James      | Kirk      | U.S.S Enterprise D      |
            | Captain   | Jean-Luc   | Picard    | U.S.S Enterprise E      |
            | Commander | William    | Riker     | U.S.S Enterprise E      |
            | Engineer  | Montgomery | Scotty    | Enterprise, Dear Lass ! |
        When I convert them to csv
        Then I get the following lines:
            | line                                                       |
            | "Captain","James","Kirk","U.S.S Enterprise D"              |
            | "Captain","Jean-Luc","Picard","U.S.S Enterprise E"         |
            | "Commander","William","Riker","U.S.S Enterprise E"         |
            | "Engineer","Montgomery","Scotty","Enterprise, Dear Lass !" |

---

Other Goodies
=============

 * Calling steps inside steps
 * @before and @after {all,each_feature,each_scenario,each_step}
 * lettuce_webdriver (for selenium tests)

---

Advanced Demo
=============

REST API tests in XiVO using lettuce:

 * https://github.com/xivo-pbx/xivo-restapi/blob/master/xivo-restapi/acceptance/features_1_1/voicemails.feature
 * https://github.com/xivo-pbx/xivo-acceptance/blob/master/xivo_steps/voicemail_steps.py

---

Thank you !
===========

 * github : gelendir
 * twitter : @gelendir
 * email : gregory.eric.sanderson@gmail.com
 * repo : http://github.com/gelendir/qcpy-lettuce
 * presentation : http://remarks.sinaapp.com/repo/gelendir/qcpy-lettuce/presentation/
