variable "project_name"{
    default = "roboshop"
}

variable "environment"{
    default = "dev"
}

variable "sg_name"{
    default = [ "mysql","redis","rabbitmq","mongodb", #databases
    
    "catalogue","shipping","cart","user","payment", #backend
    
    "frontend",#frontend
    
    "bastion",#bastion server

    "frontend_alb", #Frontend Load balancer
    
    "backend_alb",
    "open-vpn"] #Backend Load balancer

}