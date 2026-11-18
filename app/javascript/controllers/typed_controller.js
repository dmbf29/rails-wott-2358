import { Controller } from "@hotwired/stimulus";
import Typed from "typed.js";

// Connects to data-controller="typed"
export default class extends Controller {
  connect() {
    var typed = new Typed(this.element, {
      strings: ["Learn how to code.", "But ask AI for help."],
      typeSpeed: 30,
    });
  }
}
