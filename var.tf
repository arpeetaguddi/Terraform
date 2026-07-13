variable "this_key_name" {
   default = "arpeeta" 

}

variable "this_ami" {
   default = "ami-0b910d1016287a5e7 " 
}


variable "This_instance_type" {
    default  = "t3.micro"
}

variable "This_vpc_security_group_ids" {default = "sg-00c0c76b8f2d5a64a"}

variable "this_count" {
    default = 4
}

variable "this_disable_api_termination" {
    default =  false
}