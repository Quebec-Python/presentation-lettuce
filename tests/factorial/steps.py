# -*- coding: utf-8 -*-
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
