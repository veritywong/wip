import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["radioYes", "radioNo", "visited", "toVisit"]
  connect() {
    console.log('hello')
  }

  showField() {
    if(this.radioYesTarget.checked) {
      this.visitedTarget.style.display = 'block'
      this.toVisitTarget.style.display = 'none'
    } else if(this.radioNoTarget.checked) {
      this.toVisitTarget.style.display = 'block'
      this.visitedTarget.style.display = 'none'
    }
    
  }
}
