module "vpc" {
    source = "./module/network"
    vpcname = "terravpc"
    vpcidr = "10.0.0.0/16"
    subnet1cidr = "10.0.0.0/24"
    subnet2cidr = "10.0.0.0/24"
    subnet1az = "us-east-1a"
    subnet2az = "us-east-1b"
}
module "sg" {
    source = "./module/security"
    sgname = "ssh+http"
    vpcid = module.vpc.vpc_id
    depends_on = [ module.vpc ]
}