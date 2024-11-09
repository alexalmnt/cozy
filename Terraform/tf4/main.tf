module "sg" {  #give any name 
  source = "./modules/sg"  // give destination to where to resource was created
  httpport = 80         // here i am defining the variable i created inside the module folders , in modules we define variables inside the module block not inside .tfvars file
  httpsport = 443
}

module "lt" {
  source = "./modules/launchtemp"
  keyname = "devops"
  instancetype = "t2.micro"
  imageid = "ami-063d43db0594b521b"
  sgid = module.sg.securitygroup_id
  depends_on = [ module.sg ]
}

module "asg" {
  source = "./modules/asg"
  asgname = "terra-asg"
  min = 1
  max = 1
  desired = 1
  launch_temp_id = module.lt.launchtemp_id
  launch_version = module.lt.launch_template_version
  depends_on = [ module.lt ]
}