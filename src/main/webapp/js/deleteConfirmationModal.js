function displayConfirmationModal(id) {
    var modal = document.getElementById("confirmationModal");
    modal.style.display = "block";

    var deleteForm = document.getElementById("deleteForm");
    deleteForm.action = "post";
    deleteForm.method = "POST";

    var actionInput = document.getElementById("actionInput");
    actionInput.value = "delete";
}

function closeModal() {
    var modal = document.getElementById("confirmationModal");
    modal.style.display = "none";
}