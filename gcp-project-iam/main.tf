locals{
  bindings = flatten([
    for policy_key, policy in var.policy_set_policy : [
        for roles_key, role in var.policy_set_policy[policy_key].roles_policy : {
              policy_key = policy_key
              roles_key = roles_key
              role_name = role
        }
    ]
  ])
}


data google_iam_policy "iam-policy" {
  for_each = {

  }
  local
  binding {
    members = var.policy_set_policy[role.policy_key].members_policy
    role = each.value.role_name

  }

}

output "test_result" {
  value = local.bindings[*].role_name
}

resource "null_resource" "test1" {

  //noinspection HILUnresolvedReference
  triggers = {
    test = local.bindings[0].policy_key
    test1 = local.bindings[0].roles_key
    test2 = local.bindings[0].role_name
    test3 = local.bindings[1].policy_key
    test4 = local.bindings[1].roles_key
    test5 = local.bindings[1].role_name
    //data.google_iam_policy.iam-policy[each.key].policy_data
  }

}