package authz

default allow = false

# Helper rule to check if a user has a role
has_role(user, role) {
  some i
  data.users[user].roles[i] == role
}

# Allow if user is admin
allow {
  has_role(input.user, "admin")
}

# Allow if user is change_specialist_1
allow {
  has_role(input.user, "change_specialist_1")
}

# Allow if user is change_specialist_2 and request is not CLOSED
allow {
  has_role(input.user, "change_specialist_2")
  input.change_request.status != "CLOSED"
}

# Allow if user is change_specialist_3 and request is DRAFTED
allow {
  has_role(input.user, "change_specialist_3")
  input.change_request.status == "DRAFTED"
}
