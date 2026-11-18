import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="scroll" on the HTML
export default class extends Controller {
  connect() {
    // To refer to the HTML element, the controller was ON: this.element
    this.element.scrollIntoView();
  }
}
