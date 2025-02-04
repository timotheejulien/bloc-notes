function mailTo() {
	var $mailToEmail = "email@timotheejulien.fr";
	var $mailToSubject = "Notes caséologiques : prise de contact";
	window.location.href='mailto:'+$mailToEmail+'?subject='+$mailToSubject;
}

function search_modal() {
	el = document.getElementById("search_modal");
	el.style.visibility = (el.style.visibility == "visible") ? "hidden" : "visible";
	document.getElementById("search-input").focus();
}

document.addEventListener("DOMContentLoaded", function() {
   document.querySelectorAll("ul.sort-by-alphabetical").forEach(ul => {
       let items = Array.from(ul.querySelectorAll("li"));

       items.sort((a, b) => {
           let textA = a.querySelector("a")?.textContent.trim() || "";
           let textB = b.querySelector("a")?.textContent.trim() || "";
           return textA.localeCompare(textB, 'fr', { sensitivity: 'base' });
       });

       // Réinsère les éléments triés dans la liste
       ul.innerHTML = "";
       items.forEach(item => ul.appendChild(item));
   });
});