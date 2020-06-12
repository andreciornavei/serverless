/*
//variables of type string
variable "environment" {
    type = "string"
    description = "Tabela hello world"
    default = "dev"
}
*/

/*
//variables of type list
variable "list" {
    type = "list"
    default = ["a", "b", "c"]
} 
*/

/*
//variables of type map
// eg.: #map["dev"] -> in other files, we can access different values from different keys of same map
variable "map" {
    type = "map"
    default = {
        "dev"   = 1024
        "prod"  = 2048
    }
}
*/