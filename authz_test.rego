package authz_test

import data.authz

test_admin_allowed {
    authz.allow with input as {
        "user": "admin",
        "change_request": { "status": "CLOSED" }
    }
}

test_cs1_allowed {
    authz.allow with input as {
        "user": "carol",
        "change_request": { "status": "CLOSED" }
    }
}

test_cs2_allowed_when_not_closed {
    authz.allow with input as {
        "user": "carol",
        "change_request": { "status": "OPEN" }
    }
}

test_cs2_denied_when_closed {
    not authz.allow with input as {
        "user": "carol",
        "change_request": { "status": "CLOSED" }
    }
}

test_cs3_allowed_drafted {
    authz.allow with input as {
        "user": "eve",
        "change_request": { "status": "DRAFTED" }
    }
}

test_cs3_denied_non_drafted {
    not authz.allow with input as {
        "user": "eve",
        "change_request": { "status": "OPEN" }
    }
}

test_user_never_allowed {
    not authz.allow with input as {
        "user": "alice",
        "change_request": { "status": "DRAFTED" }
    }
}
