package authz

default allow = false

# Function to check if user has role
has_role(user, role) = true if {
  some i
  data.users[user].roles[i] == role
}

allow = true if{
  has_role(input.user, "admin")
}

allow = true if{
  has_role(input.user, "change_specialist_1")
}

allow = true if{
  has_role(input.user, "change_specialist_2")
  input.change_request.status != "CLOSED"
}

allow = true if{
  has_role(input.user, "change_specialist_3")
  input.change_request.status == "DRAFTED"
}
