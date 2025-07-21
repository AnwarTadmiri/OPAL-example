package authz

default allow = false

has_role(user, role) = true if {
  some i
  data.users[user].roles[i] == role
}

allow if has_role(input.user, "admin")

allow if has_role(input.user, "change_specialist_1")

allow if has_role(input.user, "change_specialist_2") and input.change_request.status != "CLOSED"

allow if has_role(input.user, "change_specialist_3") and input.change_request.status == "DRAFTED"
