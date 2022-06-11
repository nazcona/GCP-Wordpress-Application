vpc_name                    = "VPC"
region                      = "us-central1"
zone                        = "us-central-c"
instance_name               = "gcpteam-instance"
machine_type                = "n1-standard-1"
image                       = "centos-cloud/centos-7"
network_tags                = "http-server"
target-pool-name            = "gcpteam-target-pool"
autoscaler                  = "gcpteam-autoscaler"
max_replicas                = 4
min_replicas                = 1
cooldown_period             = 60
target                      = 0.5
instance_group_manager_name = "group-manager"
instance_template_name      = "my-instance-template"
source_image                = "centos-cloud/centos-7"
firewall_name               = "allow-http"




