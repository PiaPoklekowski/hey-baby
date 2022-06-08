import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tasks-list"
export default class extends Controller {
  static targets = ["cards", "line"]

  connect() {
    console.log("NOOO")
    this.categoryShow();
    this.timelineShow();
  }

  categoryShow() {
    const first = this.cardsTarget.firstElementChild.firstElementChild.clientHeight / 2;
    const last = this.cardsTarget.lastElementChild.firstElementChild.clientHeight / 2;
    this.lineTarget.style.marginTop = `${first}px`;
    this.lineTarget.style.marginBottom = `${last}px`;
    this.lineTarget.style.width = `2px`;
  }

  timelineShow() {
    const boxes = this.cardsTarget.querySelectorAll(".card-task");
    const first = boxes.item(0).clientHeight / 2;
    const last = boxes.item(boxes.length -1).clientHeight / 2;
    const taskTimer = this.cardsTarget.querySelector(".task-timer").clientHeight;
    this.lineTarget.style.marginTop = `${first + taskTimer + 30}px`;
    this.lineTarget.style.marginBottom = `${last}px`;
    this.lineTarget.style.width = `2px`;
  }
}
