import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pregnancy-week"
export default class extends Controller {
  static targets = ["pregnancy", "trimester"]

  connect() {
    let pregnancyWeek = parseInt(this.pregnancyTarget.innerText);
    let trimester = this.setTrimester(pregnancyWeek);
    trimester.classList.toggle("current-weeks");

    this.setWeek(pregnancyWeek, trimester)
  }

  setTrimester(pregnancyWeek) {
    let trimester = 0;
    if (pregnancyWeek < 4) {
      trimester = this.trimesterTargets[0]
    } else if (pregnancyWeek > 13 && pregnancyWeek < 28) {
      trimester = this.trimesterTargets[1]
    } else {
      trimester = this.trimesterTargets[2]
    }
    return trimester;
  }

  setWeek(pregnancyWeek, trimester) {
    const weeks1 = trimester.children[0].innerText.split("-");
    const weeks2 = trimester.children[1].innerText.split("-");
    const weeks3 = trimester.children[2].innerText.split("-");

    if (this.range(weeks1).includes(pregnancyWeek)) {
      trimester.children[0].classList.add("active-week")
    } else if (this.range(weeks2).includes(pregnancyWeek)) {
      trimester.children[1].classList.add("active-week")
    } else if (this.range(weeks3).includes(pregnancyWeek)) {
      trimester.children[2].classList.add("active-week")
    }
  }

  range(weeks) {
    const rangeArray = []
    for (let i = parseInt(weeks[0]); i <= parseInt(weeks[1]); i++) {
      rangeArray.push(i);
    }
    return rangeArray;
  }
}
