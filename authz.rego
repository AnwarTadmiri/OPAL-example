package authz

default allow = false

roles := data.users[input.user].roles

allow {
  "admin" in roles
}

allow {
  "change_specialist_1" in roles
}

allow {
  "change_specialist_2" in roles
  input.change_request.status != "CLOSED"
}

allow {
  "change_specialist_3" in roles
  input.change_request.status == "DRAFTED"
}
