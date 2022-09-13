/*
variable "v_azs"{
	default=["ap-southeast-1a","ap-southeast-1b","ap-southeast-1c"]
}
variable "v_vpc_cird"{
	default="10.0.0.0/16"
}
variable "v_pub_sn_cidrs"{
	default=["10.0.0.0/24","10.0.1.0/24","10.0.2.0/24"]
}
variable "v_pvt_sn_cidrs"{
	default=["10.0.3.0/24","10.0.4.0/24","10.0.5.0/24"]
}

resource "aws_vpc" "vpc1"{
	cidr_block=var.v_vpc_cird
	tags={
		"Name"="myvpc1"
	}
}
resource aws_subnet "pubsn"{
	count=length(var.v_pub_sn_cidrs)
	vpc_id=aws_vpc.vpc1.id
	availability_zone=var.v_azs[count.index]
	cidr_block=var.v_pub_sn_cidrs[count.index]
	tags={
	   Name=join("-",["Pub","Sn",count.index])
	}
}
resource aws_subnet "pvtsn"{
	count=length(var.v_pvt_sn_cidrs)
	vpc_id=aws_vpc.vpc1.id
	availability_zone=var.v_azs[count.index]
	cidr_block=var.v_pvt_sn_cidrs[count.index]
	tags={
	   Name=join("-",["Pvt","Sn",count.index])
	}
}

resource "aws_internet_gateway" "igw"{
	vpc_id=aws_vpc.vpc1.id
	tags={
	   Name="Myvpc-igw"
	}
}
resource aws_route_table "pubrt"{
     	vpc_id=aws_vpc.vpc1.id
}
resource aws_route "pubrtigw"{
	route_table_id  =aws_route_table.pubrt.id
	destination_cidr_block="0.0.0.0/0"
	gateway_id=aws_internet_gateway.igw.id
}
resource aws_route_table_association "pubass"{
	count=length(var.v_pub_sn_cidrs)
	route_table_id=aws_route_table.pubrt.id
	subnet_id=aws_subnet.pubsn.*.id[count.index]
}



*/