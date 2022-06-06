import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pregnancy-week"
export default class extends Controller {
  static targets = ["pregnancy", "trimester"]

  connect() {
    console.log(this.trimesterTargets)
    let pregnancyWeek = this.pregnancyTarget.innerText;
    console.log(pregnancyWeek); // 26
    let trimester;
    if (pregnancyWeek < 4) {
      trimester = this.trimesterTargets[0]
    } else if (pregnancyWeek > 13 && pregnancyWeek < 28) {
      trimester = this.trimesterTargets[1]
    } else {
      trimester = this.trimesterTargets[2]
    };
    console.log(trimester); // 2
    trimester.classList.toggle("current-weeks");

    console.log(trimester.children[2].innerText)
    let week1 = trimester.children[0];
    let week2 = trimester.children[1];
    let week3 = trimester.children[2];

    if (week1.innerText.includes(String(pregnancyWeek))) {
      week1.classList.add("active-week")
    } else if (week2.innerText.includes(String(pregnancyWeek))) {
      week2.classList.add("active-week")
    } else if (week3.innerText.includes(String(pregnancyWeek))) {
      week3.classList.add("active-week")
    }
  }
}
