document.addEventListener('turbolinks:load', function () {
    let controls = document.querySelectorAll('.form-inline-link')

    if (controls.length) {
        for (let i = 0; i < controls.length; i++) {
            controls[i].addEventListener('click', formInlineLinkHandler)
        }
    }
})

function formInlineLinkHandler(event) {
    event.preventDefault()

    let testId = this.dataset.testId
    formInlineHandler(testId)
}

function formInlineHandler(testId) {
    console.log(testId)
    let link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
    let testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
    let formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

    if (formInline.classList.contains('hide')) {
        testTitle.classList.add('hide')
        formInline.classList.remove('hide')
        link.textContent = 'Отмена'
    } else {
        testTitle.classList.remove('hide')
        formInline.classList.add('hide')
        link.textContent = 'Редактировать'
    }
}
