# -*- coding: utf-8 -*-
from lettuce import step, world
from hamcrest import assert_that, has_item

@step(u'Given I have the following contacts:')
def given_i_have_the_following_contacts(step):
    world.contacts = []
    for contact in step.hashes:
        world.contacts.append((contact['title'],
                               contact['first name'],
                               contact['last name'],
                               contact['ship']))

@step(u'When I convert them to csv')
def when_i_convert_them_to_csv(step):
    world.csv = convert_to_csv(world.contacts)


@step(u'Then I get the following lines:')
def then_i_get_the_following_lines(step):
    for line in step.hashes:
        csv_line = line['line']
        assert_that(world.csv, has_item(csv_line))


def convert_to_csv(contacts):
    return [
        ','.join(
            '"%s"' % field.replace('"', '\\"')
            for field in fields
        ) for fields in contacts
    ]
