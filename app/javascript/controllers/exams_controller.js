import Rails from "@rails/ujs";
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'examsForm', 'grade' ]

  connect() {}

  onSubmitResult(e) {
    e.preventDefault()
    let answers = document.querySelectorAll('.answers-list'),total = 0;

    answers.forEach((el) => {
      let selected = el.querySelectorAll('input:checked')[0];

      if (selected.value === el.dataset.correct) total += parseInt(el.dataset.points);
    });

    this.gradeTarget.value = total;
    this.gradeTarget.setAttribute('value', total);
    // debugger
    Rails.fire(this.examsFormTarget, 'submit');
  }
}
