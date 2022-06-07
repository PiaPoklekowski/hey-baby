import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pregnancy-week"
export default class extends Controller {
  static targets = ["pregnancy", "trimester", "position"]

  connect() {
    let pregnancyWeek = parseInt(this.pregnancyTarget.innerText);
    let trimester = this.setTrimester(pregnancyWeek);
    trimester.classList.toggle("current-weeks");

    this.setWeek(pregnancyWeek, trimester)
  }

  setTrimester(pregnancyWeek) {
    let trimester = 0;
    let calcPosition = 0;

    if (pregnancyWeek < 14) {
      trimester = this.trimesterTargets[0]
      calcPosition = (screen.width - trimester.clientWidth) / 2;
      this.positionTarget.style.marginLeft = `${calcPosition}px`;
    } else if (pregnancyWeek > 13 && pregnancyWeek < 28) {
      trimester = this.trimesterTargets[1]
      calcPosition = trimester.previousElementSibling.clientWidth - (screen.width - trimester.clientWidth) / 2;
      this.positionTarget.style.marginLeft = `-${calcPosition+10}px`;
    } else {
      trimester = this.trimesterTargets[2]
      const trimesterMarginRight = (screen.width - trimester.clientWidth) / 2;
      calcPosition = this.positionTarget.scrollWidth - trimester.clientWidth - trimesterMarginRight;
      trimester.style.marginRight = `${trimesterMarginRight}px`;
      this.positionTarget.style.marginLeft = `-${calcPosition}px`;
    }
    return trimester;
  }

  setWeek(pregnancyWeek, trimester) {
    let arr = Array.from(trimester.children);
    arr.forEach(week => {
      let startEnd = week.innerText.split("-")
      if (this.range(startEnd).includes(pregnancyWeek)) {
        week.classList.add("active-week")
      }
    });
  }

  range(weeks) {
    const rangeArray = []
    for (let i = parseInt(weeks[0]); i <= parseInt(weeks[1]); i++) {
      rangeArray.push(i);
    }
    return rangeArray;
  }
}
