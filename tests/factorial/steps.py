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
