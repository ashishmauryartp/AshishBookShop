// This code will run after the complete HTML page has loaded
document.addEventListener("DOMContentLoaded", function () {

    // for display current year in home page

    // Find all HTML elements having data-year attribute
    var yearElements = document.querySelectorAll("[data-year]");

    // Run a loop for every element
    yearElements.forEach(function (element) {

        // Get the current year
        var currentYear = new Date().getFullYear();

        // Put the current year inside the element
        element.textContent = currentYear;
    });


    // for SHOW / HIDE PASSWORD

    // Find all buttons having class "toggle-password"
    var passwordButtons = document.querySelectorAll(".toggle-password");

    // run a loop for every password button
    passwordButtons.forEach(function (button) {

        // add click event to the button
        button.addEventListener("click", function () {

            // get the ID of the password input
            // from the button's data-target attribute
            var inputId = button.getAttribute("data-target");

            // find the password input using its ID
            var input = document.getElementById(inputId);

            // If input does not exist, stop here
            if (!input) {
                return;
            }

            // check whether input type is password
            if (input.type == "password") {

                // Change password field to normal text
                input.type = "text";

                // Change eye icon to eye-slash
                button.innerHTML ='<i class="bi bi-eye-slash"></i>';

            } else {

                // Change normal text back to password
                input.type = "password";

                // Change eye-slash icon back to eye
                button.innerHTML ='<i class="bi bi-eye"></i>';
            }
        });
    });


    // for Form Validation

    // find all forms having data-validate attribute
    var forms = document.querySelectorAll("form[data-validate]");

    // run a loop for every form
    forms.forEach(function (form) {

        // add submit event to the form
        form.addEventListener("submit", function (event) {

            // check whether all HTML validation rules are satisfied
            if (!form.checkValidity()) {

                // stop the form from being submitted
                event.preventDefault();

                // stop further event processing
                event.stopPropagation();
            }

            // add Bootstrap validation class
            // this displays validation messages
            form.classList.add("was-validated");
        });
    });


    // for Phone number Validation
	
    // find all input fields having name="phno"
    var phoneInputs = document.querySelectorAll('input[name="phno"]');

    // run a loop for every phone input
    phoneInputs.forEach(function (phone) {

        // run this code whenever user types something
        phone.addEventListener("input", function () {

            // remove everything except numbers
            phone.value = phone.value.replace(/\D/g, "");

            // allow maximum 10 digits
            phone.value = phone.value.substring(0, 10);
        });
    });

});