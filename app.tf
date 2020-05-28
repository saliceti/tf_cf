data "cloudfoundry_domain" "cloudapps" {
    name = "london.cloudapps.digital"
}

resource "cloudfoundry_route" "static_colin" {
    domain = data.cloudfoundry_domain.cloudapps.id
    space = data.cloudfoundry_space.sandbox.id
    hostname = "static-colin"
}

resource "cloudfoundry_app" "static_colin" {
    name = "static-colin"
    space = data.cloudfoundry_space.sandbox.id
    path = "/Users/colinsaliceti/Documents/Boulot/DfE/git/static-colin.zip"
    source_code_hash = filebase64("/Users/colinsaliceti/Documents/Boulot/DfE/git/static-colin.zip")
    buildpack = "staticfile_buildpack"
    service_binding {
            service_instance = cloudfoundry_service_instance.postgres.id
        }
    routes {
        route = cloudfoundry_route.static_colin.id
    }    
}
