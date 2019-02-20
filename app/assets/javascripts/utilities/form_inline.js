document.addEventListener('turbolinks:load', function () {
    var controls = document.querySelectorAll('.form-inline-link');
    if (controls.length) {
        controls.forEach(function (item) {
            item.addEventListener('click', formInlineLinkHandler)
        })
    }

    var error = document.querySelector('.resource-errors')

    if (error) {
        var resourceId = error.dataset.resourceId
        formInlineHandler(resourceId)
    }
});

function formInlineLinkHandler(event) {
    event.preventDefault();

    var testId = this.dataset.testId;
    formInlineHandler(testId)
}

function formInlineHandler(testId) {
    var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]');
    var testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]');
    var formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]');
    var textEdit = document.querySelector('.form-inline-link[data-text-edit]').dataset.textEdit;
    var textCancel = document.querySelector('.form-inline-link[data-text-cancel]').dataset.textCancel;

    if (formInline.classList.contains('hide')) {
        testTitle.classList.add('hide')
        formInline.classList.remove('hide')
        link.textContent = textCancel
    } else {
        testTitle.classList.remove('hide')
        formInline.classList.add('hide')
        link.textContent = textEdit
    }
}
