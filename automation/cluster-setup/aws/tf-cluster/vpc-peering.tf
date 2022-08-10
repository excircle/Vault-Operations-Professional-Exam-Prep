# Disaster Recovery Peering (us-east-1, us-east-2)
resource "aws_vpc_peering_connection" "us_west_to_east" {
  provider    = aws.us-west
  vpc_id      = module.primary_us_vpc.vpc_id
  peer_vpc_id = module.secondary_us_vpc.vpc_id
  peer_region = "us-east-2"

  requester {
    allow_remote_vpc_dns_resolution = true
  }
}

resource "aws_vpc_peering_connection_accepter" "us_east_to_us_west" {
  provider = aws.us-east

  vpc_peering_connection_id = aws_vpc_peering_connection.us_west_to_east.id
  auto_accept               = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }
}

resource "aws_route" "us_west_to_east" {
  for_each = toset(module.primary_us_vpc.private_route_table_ids)

  provider                  = aws.us-west
  route_table_id            = each.key
  destination_cidr_block    = module.secondary_us_vpc.vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.us_west_to_east.id
}

resource "aws_route" "us_east_to_us_west" {
  for_each = toset(module.secondary_us_vpc.private_route_table_ids)

  provider                  = aws.us-east
  route_table_id            = each.key
  destination_cidr_block    = module.primary_us_vpc.vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.us_east_to_us_west.id
}
