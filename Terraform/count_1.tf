/*
variable "sz"{
	type=list
	default=[5,6,7]
}
resource "aws_ebs_volume" "v1"{
	count=3
	availability_zone="ap-southeast-1a"
	type="gp2"
	size=var.sz[count.index]
}*/



