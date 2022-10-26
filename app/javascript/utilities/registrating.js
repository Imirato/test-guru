document.addEventListener('turbolinks:load', function () {

    let control = document.getElementById('new_user')

    document.passwordField = document.getElementById('user_password')
    document.passwordConfirmationField = document.getElementById('user_password_confirmation')

    if (control) {
        control.addEventListener('input', passwordsComparison)
    }
})

function passwordsComparison() {
    if (!document.passwordConfirmationField.value) {
        this.querySelector('.octicon-check').classList.add('hide')
        this.querySelector('.octicon-x').classList.add('hide')
    } else if (document.passwordField.value === document.passwordConfirmationField.value) {
        this.querySelector('.octicon-check').classList.remove('hide')
        this.querySelector('.octicon-x').classList.add('hide')
    } else {
        this.querySelector('.octicon-x').classList.remove('hide')
        this.querySelector('.octicon-check').classList.add('hide')
    }
}
