import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="taskslist"
export default class extends Controller {
  static targets = ["list", "card"]

  connect() {
    this.listTarget.insertAdjacentHTML('beforeend', '<p>Hi</p>');
    renderPartial()
  }

  addCard() {

  }

}
