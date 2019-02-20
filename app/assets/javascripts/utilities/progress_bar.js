document.addEventListener('turbolinks:load', function () {
    let progressBar = document.querySelector('.progress-bar');

    if (progressBar) {
        let total = progressBar.dataset.total,
            current = progressBar.dataset.current,
            progress_percentage = 100 / total * (current - 1);

        progressBar.style.width = progress_percentage + "%";
        progressBar.setAttribute('aria-valuenow', progress_percentage);
    }
});
