
variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "image_name" {
  type        = string 
  default     = "ubuntu-2004-lts-oslogin"
  description = "release name"
}

variable "vm_platform_id" {
  type        = string
  default     = "standard-v1"       
  description = "yandex platform"
}

variable "vms_ssh_root_key" {                                                             
  type = string
  default = "ssh = "
  description = "ssh-keygen -t ed25519"
  sensitive   = true
  }

variable "each_vm" {
  type = list(object({  vm_name=string, cpu=number, ram=number, disk_volume=number, core_fraction = number }))
  default = [
    {
      vm_name = "k8s-master-01",
      cpu = 2,
      ram = 4,
      disk_volume = 20,
      core_fraction = 100
    },
    {
      vm_name = "k8s-worker-01",
      cpu = 2,
      ram = 2,
      disk_volume = 15,
      core_fraction = 100
    },
    {
      vm_name = "k8s-worker-02",
      cpu = 2,
      ram = 2,
      disk_volume = 15,
      core_fraction = 100
    },
        {
      vm_name = "k8s-worker-03",
      cpu = 2,
      ram = 2,
      disk_volume = 15,
      core_fraction = 100
    },
        {
      vm_name = "k8s-worker-04",
      cpu = 2,
      ram = 2,
      disk_volume = 15,
      core_fraction = 100
    }
  ]
}