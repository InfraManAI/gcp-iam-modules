locals {
  bindings = flatten([
  for policy_key, policy in var.policy_set : [
  for roles_key, role in var.policy_set[policy_key].roles : {
    policy_key = policy_key
    roles_key = roles_key
    role_name = role
  }
  ]
  ])
}


