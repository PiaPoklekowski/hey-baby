import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Hello")
  }

  hideInfoWindow() {
    document.querySelectorAll(".hospital-details").forEach((detail) => {
      detail.classList.add("hide")
    })
  }
}
