import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ["body"]
    initialize() {
        console.log('Inline edit form controller initialized')
    }
}