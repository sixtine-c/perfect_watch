import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["question"]

  nextquestion(event) {
    console.log(this.questionTarget)
    this.questionTarget.classList.remove('next-question')
    this.questionTarget.classList.add('visible-question')
  }

  //   console.log(this)
    // this.questionTarget.


    // forEach(element => {
    //   moodList.forEach(mood => {
    //     if (element.classList.contains(mood)) {
    //       element.classList.remove(mood)
    //     }
    //   });
    //   element.classList.add(event.currentTarget.dataset.color)
    // });
  // }
}
