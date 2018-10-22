variable "listener_action" {
  type        = "map"
  description = "A map of Load Balancer Listener and default target group action, both specified as PROTOCOL:PORT."
}


# Resources
#--------------------------------------------------------------

data "null_data_source" "values" {
  count    = "${length(keys(var.listener_action))}"
  inputs = {
    arn_index = "${element(split(":", element(keys(var.listener_action), count.index)), 0) == "HTTPS" ? format("%d",count.index) : ""}"
  }
}


# Outputs
#--------------------------------------------------------------

output "input_map" {
 value = "${var.listener_action}"
 description = "printing input map"
}

output "index_key_https" {
  value       = "${compact(data.null_data_source.values.*.inputs.arn_index)}"
  description = "rendered list"
}
