#RSV
variable "utilities_rg_name" {}
variable "location" {}
variable "rsv_name" {
  type        = string
  description = "recovery service vault name"
}

#RSV Policy

variable "backup_policy_name" {}
variable "backup_policy_timezone" {}
variable "backup_policy_frequency" {}
variable "backup_policy_time" {}
variable "backup_retention_daily_count" {}
variable "backup_retention_weekly_weekdays" {}
variable "backup_retention_weekly_count" {}
variable "backup_retention_monthly_weeks" {}
variable "backup_retention_monthly_weekdays" {}
variable "backup_retention_monthly_count" {}
variable "backup_retention_yearly_months" {}
variable "backup_retention_yearly_weeks" {}
variable "backup_retention_yearly_weekdays" {}
variable "backup_retention_yearly_count" {}

# variable "bh_vm_id" {}

