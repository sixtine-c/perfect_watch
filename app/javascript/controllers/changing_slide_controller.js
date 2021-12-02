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

  goTo(evt) {
    console.log(evt.params.step)
    const [visible, hidden] = this.split(this.questionTargets, evt.params.step)
    this._toggleVisible(visible)
    this._toggleHidden(hidden)
  }
  _toggleVisible(items) {
    items.forEach((item) => {
      item.classList.add('visible-question')
      item.classList.remove('next-question')
    });
  }
  _toggleHidden(items) {
    items.forEach((item) => {
      item.classList.remove('visible-question')
      item.classList.add('next-question')
    })
  }
  split(array, n) {
    return [array.slice(0, n), array.slice(n)]
  }
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
