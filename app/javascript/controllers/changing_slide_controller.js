import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["question"]

  nextquestion() {
    let i = 0
    const questions = this.questionTargets
    for (i=0; i <= questions.length; i++){
      if (questions[i].classList.contains("next-question")) {
        questions[i].classList.remove('next-question')
        questions[i].classList.add('visible-question')
        break;
      }

    }
  };

  previousquestion() {
    let i
    const questions = this.questionTargets
    for (i=questions.length - 1; i >= 0; i--){
      if (questions[i].classList.contains("visible-question")) {
        questions[i].classList.remove('visible-question')
        questions[i].classList.add('next-question')
        break;
      }

    }
  };

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
