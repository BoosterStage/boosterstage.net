import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["sprints", "sprintsLabel", "weeks", "budget"];

  static sprintCost = 14000;

  connect() {
    this.estimate();
  }

  estimate() {
    this.budgetTarget.value = this.formatEstimate(this.calculateEstimate());
    this.setPos();
  }

  setPos() {
    var control = this.sprintsTarget,
      controlMin = control.getAttribute("min"),
      controlMax = control.getAttribute("max"),
      controlVal = control.value,
      controlThumbWidth = 18;

    var range = controlMax - controlMin;
    var position = ((controlVal - controlMin) / range) * 100;
    var positionOffset =
      Math.round((controlThumbWidth * position) / 100) - controlThumbWidth / 2;
    var output = this.sprintsLabelTarget;

    output.style.left = "calc(" + position + "% - " + positionOffset + "px)";
    this.sprintsLabelTarget.innerHTML = this.sprintsTarget.value + " Sprints";
  }

  calculateEstimate() {
    return this.sprintsTarget.value * 14000;
  }

  formatEstimate(amount, decimalCount = 0) {
    decimalCount = Math.abs(decimalCount);
    decimalCount = isNaN(decimalCount) ? 2 : decimalCount;

    let i = parseInt(
      (amount = Math.abs(Number(amount) || 0).toFixed(decimalCount))
    ).toString();
    let j = i.length > 3 ? i.length % 3 : 0;

    return (
      "$ " +
      (j ? i.substr(0, j) + "," : "") +
      i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + ",")
    );
  }
}

// https://codepen.io/yannicvanveen/pen/HtvbI
