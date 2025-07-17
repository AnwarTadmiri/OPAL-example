package authz

default allow = false

role := data.user_roles[input.user]

allow {
  role == "admin"
}

allow {
  role == "change_specialist_1"
}

allow {
  role == "change_specialist_2"
  input.change_request.status != "CLOSED"
}

allow {
  role == "change_specialist_3"
  input.change_request.status == "DRAFTED"
}

