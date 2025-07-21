# OPA / OPAL / Keycloak To-Do List

## 1. Set-up

- Run Keycloak locally
- Run OPAL locally (not just OPA)
- Understand that OPAL is an integration aggregator of policies and data for OPA
- Set up OPAL with embedded OPA agents
- Configure a custom provider for Keycloak so that OPAL can retrieve user/roles info from Keycloak

## 2. Policy Development

- Write a Rego policy using the roles and permissions scenario
- Reuse lessons learned from previous policies
- Design a new scenario to cover with your policy (see next section)

## 3. Authorization Scenario

### Roles

- 5 different users with one of the following roles:
  - user
  - admin
  - change specialist 1
  - change specialist 2
  - change specialist 3

### Permissions

- 1 permission: `ADD_ATTACHMENT`
- 1 input object: `change-request`

### Rules

- `admin` and `change specialist 1` can always add attachments
- `change specialist 2` can add attachments only if `change-request.status != CLOSED`
- `change specialist 3` can add attachments only if `change-request.status == DRAFTED`
- `user` cannot add attachments

## 4. Data Integration

- Explore data setups for OPAL/OPA:
  - Static JSON
  - REST endpoints
  - Database
- Explore using Git as a policy store

## 5. Testing

- Write Rego unit tests for the defined policies
- Write integration tests for the full stack (Keycloak -> OPAL -> OPA)

## 6. System Behavior

- Input to OPA should contain only:
  - the user
  - the `change-request` object
- OPAL should resolve:
  - the user’s roles
  - what each role is allowed to do
