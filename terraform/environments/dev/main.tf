module "users" {
    source          = "../../infra/users"
    environment     = var.environment
    write_capacity  = 1
    read_capacity   = 1
    jwt_secret      = var.jwt_secret
    admin_id        = var.admin_id
    admin_name      = var.admin_name
    admin_email     = var.admin_email
    admin_password  = var.admin_password
}

module "bookings" {
    source                  = "../../infra/bookings"
    environment             = var.environment
    write_capacity          = 1
    read_capacity           = 1    
    sns_notifications_arn   = module.notifications.notifications_topic_arn
}

module "notifications" {
    source          = "../../infra/notifications"
    environment     = var.environment
}