import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ["body", "form"]
    initialize() {
    }

    showForm() {
        this.bodyTarget.classList.add('d-none')
        this.formTarget.classList.remove('d-none')
        $('#' + this.formTarget.id).find('textarea').focus()
    }

    hideForm() {
        this.bodyTarget.classList.remove('d-none')
        this.formTarget.classList.add('d-none')
    }
}