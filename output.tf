output "VPC" {
    value = google_compute_network.vpc_network.id
}


output  "vpc_cidr_block" {
    value =  google_compute_network.vpc_cidr_block.id
}


output "NAT" {
    value = google_compute_router_nat.id
}

output  "firewall" "allow_http"{
     value = google_compute_firewall.allow_http.name
}    

output "gcp-project_name"{
    value = google_project.id
}


output "vpc_arn" {
    value = google_compute_network.vpc_network.arn

}

output "vpc_cidr_block" {
    value = ""

 }

 output "private_subnets" { 
    value = google_compute_subnetwork.private1.id

 }

 output  "private_subnets" {
    value = google_compute_subnetwork.private2.id
 }   


output  "private_subnets" {
    value = google_compute_subnetwork.private3.id
}

output "private_subnet_arns" {
    value = google_compute_subnetwork.private.private_subnet_arns

}  

output "private_subnets_cidr_blocks" {
    value = google_compute_subnetwork.private_subnets_cidr_blocks

 }

 output "private_subnets_ipv6_cidr_blocks" {
    value = google_compute_subnetwork.private.private_subnets_ipv6_cidr_blocks

 }      


output  "public_subnets" {
    value = google_compute_subnetwork.public1.id

}

output  "public_subnets" {
    value = google_compute_subnetwork.public2.id
}

output  "public_subnets" {
    value = google_compute_subnetwork.public3.id
}

output   "public_subnet_arns" {
    value = google_compute_subnetwork.public_subnet_arns
}


output  "public_subnets_cdir_blocks" {
    value = google_compute_subnetwork.public_subnets_cdir_blocks
}

output  "private_subnets_ipv6_cidr_blocks" {
    value = google_compute_subnetwork.public_subnets_ipv6_cidr_blocks
}


