package authz

default allow = false

# Function to check if user has role
has_role(user, role) {
  some i
  data.users[user].roles[i] == role
}


allow {
  has_role(input.user, "change_specialist_1")
}

allow {
  has_role(input.user, "change_specialist_2")
  input.change_request.status != "CLOSED"
}

allow {
  has_role(input.user, "change_specialist_3")
  input.change_request.status == "DRAFTED"
}
