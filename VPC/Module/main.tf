module "VPC" {
    source = "../"
    public1_cidr  = "10.0.1.0/24"
    public2_cidr  = "10.0.2.0/24"
    public3_cidr  = "10.0.3.0/24"
    private1_cidr = "10.0.101.0/24"
    private2_cidr = "10.0.102.0/24"
    private3_cidr = "10.0.103.0/24"
}