import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dialog", "frame"]

  connect() {
    this._handleFrameLoad = this.handleFrameLoad.bind(this)
    this.frameTarget.addEventListener("turbo:frame-load", this._handleFrameLoad)
  }

  disconnect() {
    this.frameTarget.removeEventListener("turbo:frame-load", this._handleFrameLoad)
  }

  handleFrameLoad() {
    if (this.frameTarget.innerHTML.trim() === "") {
      this.close()
    } else {
      this.open()
    }
  }

  open() {
    if (!this.dialogTarget.open) {
      this.dialogTarget.showModal()
    }
  }

  close() {
    if (this.dialogTarget.open) {
      this.dialogTarget.close()
    }
    this.frameTarget.innerHTML = ""
  }

  closeOnBackdrop(event) {
    if (event.target === this.dialogTarget) {
      this.close()
    }
  }

  closeOnSubmit(event) {
    if (event.detail.success) {
      this.close()
    }
  }
}
