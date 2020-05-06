resource "cloudfoundry_app" "static_colin" {
    name = "static-colin"
    space = "${data.cloudfoundry_space.sandbox.id}"
    path = "/path/to/app.zip"
    buildpack = "staticfile_buildpack"
}
