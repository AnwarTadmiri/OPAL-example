package authz

default allow = false

roles := data.users[input.user].roles

allow {
  some role
  role := data.users[input.user].roles[_]
  role == "admin"
}

allow {
  some role
  role := data.users[input.user].roles[_]
  role == "change_specialist_1"
}

allow {
  some role
  role := data.users[input.user].roles[_]
  role == "change_specialist_2"
  input.change_request.status != "CLOSED"
}

allow {
  some role
  role := data.users[input.user].roles[_]
  role == "change_specialist_3"
  input.change_request.status == "DRAFTED"
}
