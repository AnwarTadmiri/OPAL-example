package authz_test

import data.authz

test_admin_allowed if {
    authz.allow with input as {
        "user": "admin",
        "change_request": { "status": "CLOSED" }
    }
}

test_cs1_allowed if {
    authz.allow with input as {
        "user": "carol",
        "change_request": { "status": "CLOSED" }
    }
}

test_cs2_allowed_when_not_closed if {
    authz.allow with input as {
        "user": "carol",
        "change_request": { "status": "OPEN" }
    }
}

test_cs2_denied_when_closed if {
    not authz.allow with input as {
        "user": "carol",
        "change_request": { "status": "CLOSED" }
    }
}

test_cs3_allowed_drafted if {
    authz.allow with input as {
        "user": "eve",
        "change_request": { "status": "DRAFTED" }
    }
}

test_cs3_denied_non_drafted if {
    not authz.allow with input as {
        "user": "eve",
        "change_request": { "status": "OPEN" }
    }
}

test_user_never_allowed if {
    not authz.allow with input as {
        "user": "alice",
        "change_request": { "status": "DRAFTED" }
    }
}
