import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="spin"
export default class extends Controller {
  start(event) {
    event.currentTarget.insertAdjacentHTML(
      "beforeend",
      '<i class="btn btn-primary fa-solid fa-person-through-window fa-flip"></i>',
    );
  }
}
