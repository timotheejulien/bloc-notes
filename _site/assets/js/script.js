function mailTo() {
   var mailToEmail = "email@timotheejulien.fr";
   var mailToSubject = "Bloc-notes : prise de contact";
   window.location.href = 'mailto:' + mailToEmail + '?subject=' + encodeURIComponent(mailToSubject);
}

function search_modal() {
   let el = document.getElementById("search_modal");
   if (!el) return;
   let isVisible = el.style.visibility === "visible";
   el.style.visibility = isVisible ? "hidden" : "visible";
   if (!isVisible) {
      document.getElementById("search-input").focus();
   }
}

document.addEventListener("keydown", function(event) {
   if (event.key === "Escape") {
      let el = document.getElementById("search_modal");
      if (el && el.style.visibility === "visible") {
         let input = document.getElementById("search-input");
         if (input) input.value = "";
         search_modal();
      }
   }
});

document.addEventListener("DOMContentLoaded", function() {
   // Bouton contact footer
   let contactBtn = document.getElementById("footer-contact-btn");
   if (contactBtn) {
      contactBtn.addEventListener("click", mailTo);
   }

   // Tri alphabétique des listes
   document.querySelectorAll("ul.sort-by-alphabetical").forEach(ul => {
      let items = Array.from(ul.querySelectorAll("li"));
      items.sort((a, b) => {
         let textA = a.querySelector("a")?.textContent.trim() || "";
         let textB = b.querySelector("a")?.textContent.trim() || "";
         return textA.localeCompare(textB, 'fr', { sensitivity: 'base' });
      });
      ul.innerHTML = "";
      items.forEach(item => ul.appendChild(item));
   });
});
