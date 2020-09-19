
module "get-policy-bindings" {
  source = "../helpers"
  policy_set = var.policy_set_policy
}

module "get-member-bindings" {
  source = "../helpers"
  policy_set = var.policy_set_member
}

data google_iam_policy "iam-policy" {
  for_each = {for instance in module.get-policy-bindings.bindings: "${instance.policy_key}.${instance.roles_key}" => instance}
  binding {
    members = var.policy_set_policy[each.value.policy_key].members
    role = each.value.role_name
  }
}

resource "google_project_iam_policy" "project-iam-policy" {
  for_each = data.google_iam_policy.iam-policy
  policy_data = each.value.policy_data
  project = var.projectid
}

resource "google_project_iam_member" "project-iam-member" {
  for_each = {for instance in module.get-member-bindings.bindings: "${instance.policy_key}.${instance.roles_key}" => instance}
  member = var.policy_set_member[each.value.policy_key].members[0]
  role = each.value.role_name
}



/*
resource "null_resource" "test1" {
   for_each = {for binding in local.bindings: "${binding.policy_key}.${binding.roles_key}"=> binding}
  //noinspection HILUnresolvedReference
  triggers = {
    test_policy_key  = each.value.policy_key
    test_roles_key = each.value.roles_key
    test_role_name = each.value.role_name
  }
}

resource "null_resource" "test-2" {
  for_each = data.google_iam_policy.iam-policy
  triggers = {
    test_2 = each.value.policy_data
  }
}
*/