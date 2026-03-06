
###
# Resource: BTP_SUBACCOUNT
###
# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "fe8b1727-42d4-431c-98bb-c8157c5bf74f"
resource "btp_subaccount" "subaccount_0" {
  beta_enabled = true
  labels = {
    costcenter = ["12345"]
    stage      = ["DEV"]
  }
  name      = "DEV Project SHAR"
  region    = var.region
  subdomain = "dev-project-shar-466d7f90-036d-7229-9c61-39c45104231a"
  usage     = "UNSET"
}

###
# Resource: BTP_SUBACCOUNT_ENTITLEMENT
###
# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "btp_subaccount_entitlement" "entitlement_2" {
  plan_name              = "standard"
  plan_unique_identifier = "alertnotificationservicecf"
  service_name           = "alert-notification"
  subaccount_id          = btp_subaccount.subaccount_0.id
}

# __generated__ by Terraform
resource "btp_subaccount_entitlement" "entitlement_1" {
  plan_name              = "trial"
  plan_unique_identifier = "cloudfoundry-trial"
  service_name           = "cloudfoundry"
  subaccount_id          = btp_subaccount.subaccount_0.id
}

# __generated__ by Terraform
resource "btp_subaccount_entitlement" "entitlement_0" {
  plan_name              = "default"
  plan_unique_identifier = "auditlog-management-default"
  service_name           = "auditlog-management"
  subaccount_id          = btp_subaccount.subaccount_0.id
}

###
# Resource: BTP_SUBACCOUNT_SUBSCRIPTION
###
# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "btp_subaccount_subscription" "subscription_0" {
  app_name      = "feature-flags-dashboard"
  plan_name     = "dashboard"
  subaccount_id = btp_subaccount.subaccount_0.id
}

###
# Resource: BTP_SUBACCOUNT_SERVICE_INSTANCE
###
# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "fe8b1727-42d4-431c-98bb-c8157c5bf74f,11f78953-7d84-40d7-9d76-6f64402dbe2c"
resource "btp_subaccount_service_instance" "serviceinstance_0" {
  name           = "dev-project-shar-alert-notification"
  serviceplan_id = data.btp_subaccount_service_plan.alert-notification_standard.id
  shared         = false
  subaccount_id  = btp_subaccount.subaccount_0.id
}

###
# Resource: BTP_SUBACCOUNT_SECURITY_SETTING
###
# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "fe8b1727-42d4-431c-98bb-c8157c5bf74f"
resource "btp_subaccount_security_settings" "secsetting" {
  access_token_validity                    = -1
  custom_email_domains                     = []
  default_identity_provider                = "sap.default"
  iframe_domains_list                      = []
  refresh_token_validity                   = -1
  subaccount_id                            = btp_subaccount.subaccount_0.id
  treat_users_with_same_email_as_same_user = false
}

data "btp_subaccount_service_plan" "alert-notification_standard" {
  subaccount_id = btp_subaccount.subaccount_0.id
  offering_name = "alert-notification"
  name          = "standard"
  depends_on    = [btp_subaccount_entitlement.entitlement_2]
}
