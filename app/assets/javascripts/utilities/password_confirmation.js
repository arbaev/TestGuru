document.addEventListener('turbolinks:load', function () {
    let password = document.querySelector('#user_password'),
        password_confirm = document.querySelector('#user_password_confirmation');

    if (password && password_confirm) {
        password.addEventListener('input', password_matching);
        password_confirm.addEventListener('input', password_matching);
    }
});

function password_matching() {
    if (password.value != '' && password.value == password_confirm.value) {
        password_confirm.classList.remove('is-invalid');
        password_confirm.classList.add('is-valid');
    } else if (password_confirm.value == "") {
        password_confirm.classList.remove('is-valid');
        password_confirm.classList.remove('is-invalid');
    } else {
        password_confirm.classList.add('is-invalid');
    }
}
