package authz

default allow = false

allow {
  "admin" in data.users[input.user].roles
}

allow {
  "change_specialist_1" in data.users[input.user].roles
}

allow {
  "change_specialist_2" in data.users[input.user].roles
  input.change_request.status != "CLOSED"
}

allow {
  "change_specialist_3" in data.users[input.user].roles
  input.change_request.status == "DRAFTED"
}
