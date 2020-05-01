require 'pathname'
require 'yaml'

require 'term/ansicolor'
class String
  include Term::ANSIColor
end

require 'manageiq/rpm_build/helper'
require 'manageiq/rpm_build/build_copr'
require 'manageiq/rpm_build/generate_gemset'
require 'manageiq/rpm_build/generate_tar_files'
require 'manageiq/rpm_build/setup_source_repos'

module ManageIQ
  module RPMBuild
    ROOT_DIR     = Pathname.new("../..").expand_path(__dir__)
    CONFIG_DIR   = ROOT_DIR.join("config")
    SCRIPT_DIR   = ROOT_DIR.join("scripts")

    options      = YAML.load_file(CONFIG_DIR.join("options.yml"))
    BUILD_DIR    = Pathname.new(options["build_dir"]).expand_path
    RPM_SPEC_DIR = BUILD_DIR.join("rpm_spec")

    PRODUCT_NAME = options["product_name"]
    VERSION      = options["version"]
    RELEASE      = options["release"]

    BUILD_DATE   = Time.now.strftime("%Y%m%d%H%M%S")
    GEM_HOME     = BUILD_DIR.join("#{PRODUCT_NAME}-gemset-#{VERSION}")
  end
end
