
locals {
  members_dic = var.members_dic
  service_account_dic = var.service_account_dic
  roles_dic =  var.roles_dic
  policy_set_policy = var.policy_set_policy
  policy_set_binding = var.policy_set_binding
  policy_set_member = var.policy_set_member

}

data "google_iam_policy" "policies"{
  for_each = var.policy_set_policy
  binding {
    members =  [ "serviceAccount:${google_service_account.sa-policy[each.key].email}" ]
    role = each.value.roles_policy[0]
  }
}

resource "google_service_account" "sa-policy" {
  for_each = var.policy_set_policy
  account_id = var.policy_set_policy[each.key].service_accounts_policy[0]
  display_name = var.policy_set_policy[each.key].desc_policy
}

resource "google_service_account" "sa-member" {
  for_each = var.policy_set_member
  account_id = var.policy_set_member[each.key].service_accounts_member[0]
  display_name = var.policy_set_member[each.key].desc_member
}

resource "google_service_account_iam_policy" "sa-iam-policy"{
  for_each = var.policy_set_policy
  policy_data = data.google_iam_policy.policies[each.key].policy_data
  service_account_id = google_service_account.sa-policy[each.key].id
}

data google_service_account "sa-binding"{
  for_each = var.policy_set_binding
  account_id = each.value.service_accounts_binding[0]
}

resource "google_service_account_iam_binding" "sa-iam-binding"{
  for_each = var.policy_set_binding
  members = each.value.members_binding
  role = each.value.roles_binding[0]
  service_account_id = data.google_service_account.sa-binding[each.key].name
  //condition = var.condition_binding
}

/*
resource "google_service_account_iam_member" "sa-iam-member" {
  for_each = var.policy_set
  member = var.members_member
  role = var.role_member
  service_account_id = var.service_account_id_member
  condition = var.condition_member
}*/

variable "default_trigger" {
  default = ""
}

