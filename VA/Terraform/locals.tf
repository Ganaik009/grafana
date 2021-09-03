locals { 
    # Common Tags
  common_tags = {
      Environment           = var.environment_tag_value
      Created_by            = var.createdby_tag_value
      Date_Created          = formatdate("MMM DD, YYYY", timeadd(timestamp(), "-4h"))
  }
  
  dedicated_tags = { 
      Purpose               = var.tag1_value
      #purpose              = var.tag2_value
      #Management           = var.tag3_value
      
  }
}