resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone                                           
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.image_name     
}

resource "yandex_compute_instance" "vms" {            
  for_each = { for k in var.each_vm : k.vm_name => k }
  name        = each.value.vm_name                                                             
  platform_id = var.vm_platform_id
  hostname    = each.value.vm_name
  resources {
    cores         = each.value.cpu                          
    memory        = each.value.ram                          
    core_fraction = each.value.core_fraction   

  }

# resource "yandex_compute_instance" "vms" {
#   count       = 2
#   name        = var.vm-${count.index + 1}                                                           
#   platform_id = var.vm_platform_id
#   hostname    = var.vm-${count.index + 1} 
#   resources {
#     cores         = var.vms_resources.vm.cores                           
#     memory        = var.vms_resources.vm.memory                          
#     core_fraction = var.vms_resources.vm.core_fraction           
#   }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type = "network-hdd"
      size = each.value.disk_volume
    }
  }

  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = true
  }
  
  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }

}

data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    vms_ssh_root_key = var.vms_ssh_root_key  # Передача переменной в шаблон
  }
}
