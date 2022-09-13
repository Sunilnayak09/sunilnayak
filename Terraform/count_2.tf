/*
1) Create Ec2 Instance
2) Attach EIP to the Instannce if env is Prod
*/
/*
variable "env"{
}
resource "aws_instance" "i1"{
	ami="ami-0c802847a7dd848c0"
	instance_type="t2micro"
}
resource "aws_eip" "myeip1"{
	count=var.env=="prod"?1:0
	instance=aws_instance.i1.id
}

*/