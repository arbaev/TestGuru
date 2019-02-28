document.addEventListener('turbolinks:load', function () {
    var selectCriterion = document.querySelector("#badge_criterion");

    if (selectCriterion) {
        selectCriterion.addEventListener('change', formOptionsHandler);
    }

});

function formOptionsHandler() {
    var formParam = document.querySelector("#param");
    var selectParam = document.querySelector("#badge_param");
    var categoriesData = document.querySelector("#data-categories").dataset.categories;
    var testsData = document.querySelector("#data-tests").dataset.tests;
    var levelsData = document.querySelector("#data-levels").dataset.levels;
    var categories = JSON.parse(categoriesData);
    var tests = JSON.parse(testsData);
    var levels = JSON.parse(levelsData);

    formParam.classList.remove("hide");
    // console.log(levels);

    if (this.value == "first_try") {
        setOptions(tests, selectParam)
    } else if (this.value == "all_category") {
        setOptions(categories, selectParam)
    } else {
        setOptions(levels, selectParam)
    }
}

function setOptions(items_array, select) {
    select.options.length = 0;

    items_array.map(function (item) {
        var option = document.createElement("option");
        option.value = item[0];
        option.text = item[1];
        select.appendChild(option);
    })
}
