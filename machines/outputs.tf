output "msf1_network" {
    value = module.MSF1.Instance_IP
}

output "msf2_network" {
    value = module.MSF2.Instance_IP
}

output "golden_eye_network" {
    value = module.geye.Instance_IP
}