vpc_name                    = "VPC"
region                      = "us-central1"
zone                        = "us-central-c"
public1_cidr  = "10.0.1.0/24"
public2_cidr  = "10.0.2.0/24"
public3_cidr  = "10.0.3.0/24"
private1_cidr = "10.0.101.0/24"
private2_cidr = "10.0.102.0/24"
private3_cidr = "10.0.103.0/24"
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




