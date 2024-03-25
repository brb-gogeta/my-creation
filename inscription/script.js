const date = document.querySelector('.datepicker');
M.Datepicker.init(date,{format:'d-mmm-yyyy'});

// Validation email de confirmation //

function validateMail(p1, p2) {
if (p1.value != p2.value || p1.value == '' || p2.value == '') {
    p2.setCustomValidity('Email incorrect');
} else {
    p2.setCustomValidity('');
}
}
