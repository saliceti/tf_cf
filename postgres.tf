data cloudfoundry_service postgres {
    name = "postgres"
}

resource "cloudfoundry_service_instance" "postgres" {
  name = "colin-postgres"
  space = data.cloudfoundry_space.sandbox.id
  service_plan = data.cloudfoundry_service.postgres.service_plans["tiny-unencrypted-9_5"]
}
