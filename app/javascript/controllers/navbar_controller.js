import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menu"];
  hidden_attribute;

  toggleMenu() {
    console.log("Menu toggled");
    if (this.menuTarget.attributes.getNamedItem("hidden")) {
      this.hidden_attribute = this.menuTarget.attributes.getNamedItem("hidden");
      this.menuTarget.attributes.removeNamedItem("hidden");
    } else {
      this.menuTarget.attributes.setNamedItem(this.hidden_attribute);
    }
  }
}
