class StimulusControllerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  def create_stimulus_controller_file
    create_file "app/javascript/controllers/#{file_name}_controller.js", <<-FILE
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Hello from #{file_name}_controller.js");
  }
}
    FILE
  end
end
