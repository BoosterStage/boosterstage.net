import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["nav"];

  toggleNav() {
    for (let el of this.navTargets) {
      el.classList.toggle("hidden");
    }
  }
}
