output "vm_instances" {
  description = "Все созданные ВМ с их параметрами"
  value = {
    for name, instance in yandex_compute_instance.vms : name => {
      "name"       = instance.name
 #     "hostname"   = instance.hostname
      "public_ip"  = instance.network_interface[0].nat_ip_address
 #     "private_ip" = instance.network_interface[0].ip_address
 #     "fqdn"       = instance.fqdn
    }
  }
}