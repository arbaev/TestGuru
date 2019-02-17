document.addEventListener('turbolinks:load', function () {
    var title = document.querySelector('#title'),
        questions = document.querySelector('#questions'),
        level = document.querySelector('#level'),
        category = document.querySelector('#category');

    if (title) { title.addEventListener('click', sortColumn); }
    if (questions) { questions.addEventListener('click', sortColumn); }
    if (level) { level.addEventListener('click', sortColumn); }
    if (category) { category.addEventListener('click', sortColumn); }
});

function sortColumn() {
    tbody = document.querySelector('tbody');
    trs = tbody.querySelectorAll('tr');
    window.index = this.cellIndex;

    sortedRows = [].map.call(trs, tr => { return tr });

    sortedRows.sort(compareRows)

    replaceTbody(tbody, sortedRows)
}

function compareRows(row1, row2) {
    var item1 = row1.querySelectorAll('td')[window.index].textContent;
    var item2 = row2.querySelectorAll('td')[window.index].textContent;

    if (item1 < item2) {
        return -1
    }
    if (item1 > item2) {
        return 1
    }
    return 0
}

function replaceTbody(tbody, rows) {
    sortedTbody = document.createElement('tbody');

    if (tbody.classList.contains('asc')) {
        rows.reverse()
    } else {
        sortedTbody.classList.add('asc')
    }

    rows.map(function (tr) { sortedTbody.appendChild(tr) })
    tbody.parentNode.replaceChild(sortedTbody, tbody)
}
