/*
====================================================================
Copyright (c) 2008 Ian Blumel.  All rights reserved.

This software is licensed as described in the file LICENSE, which
you should have received as part of this distribution.
====================================================================
File: test_multi_old_style_suite_a.h

*/

#include <string.h>

#include "fct.h"

FCT_SUITE_BGN(multi_a)
{
    FCT_TEST_BGN(test_multi_a_1)
    {
        fct_chk(strcmp("a", "b") != 0);
    }
    FCT_TEST_END();

    FCT_TEST_BGN(test_multi_a_2)
    {
        fct_chk(strcmp("a", "a") == 0);
    }
    FCT_TEST_END();
}
FCT_SUITE_END()

