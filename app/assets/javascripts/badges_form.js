document.addEventListener('turbolinks:load', function () {
    var selectCriterion = document.querySelector("#badge_criterion");

    if (selectCriterion) {
        selectCriterion.addEventListener('change', formOptionsHandler);
    }

});

function formOptionsHandler() {
    var formParam = document.querySelector("#param");
    var selectParam = document.querySelector("#badge_param");
    var categories_data = document.querySelector("#data-categories").dataset.categories;
    var tests_data = document.querySelector("#data-tests").dataset.tests;
    var levels_data = document.querySelector("#data-levels").dataset.levels;
    var categories = JSON.parse(categories_data);
    var tests = JSON.parse(tests_data);
    var levels = JSON.parse(levels_data);

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
