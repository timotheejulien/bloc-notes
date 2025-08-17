(function () {
  const searchInput = document.getElementById('search-input');
  const resultsContainer = document.getElementById('results-container');

  if (!searchInput || !resultsContainer) {
    console.warn('[search] Élément introuvable: #search-input ou #results-container');
    return;
  }

  // Masquer au chargement
  resultsContainer.style.display = 'none';

  // Instancie SimpleJekyllSearch
  SimpleJekyllSearch({
    searchInput: searchInput,
    resultsContainer: resultsContainer,
    json: '/search.json',                        // Ajuste si ton site a un baseurl
    searchResultTemplate: `
      <li class="search-item">
        <a class="search-item-link" href="{url}" title="{title}">
          <p class="search-item-title">{title}</p>
          <p class="search-description">{description}</p>
        </a>
      </li>
    `,
    noResultsText: '',                           // Laisse vide pour pouvoir masquer la liste
    fuzzy: false,
    limit: 10,
    templateMiddleware: function (prop, value) {
      const q = searchInput.value.trim();
      if ((prop === 'title' || prop === 'description') && typeof value === 'string') {
        return highlight(value, q);
      }
      return value;
    }
  });

  // Surlignage simple (avec échappement des caractères spéciaux)
  function highlight(text, query) {
    if (!query) return text;
    const escaped = query.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
    return text.replace(new RegExp(`(${escaped})`, 'gi'), '<mark>$1</mark>');
  }

  // Met à jour la visibilité en fonction du contenu rendu
  const updateVisibility = () => {
    const q = searchInput.value.trim();
    if (!q) {
      resultsContainer.style.display = 'none';
      resultsContainer.innerHTML = '';
      return;
    }
    // Laisse le temps à SJS de rendre, puis vérifie s'il y a des items
    requestAnimationFrame(() => {
      const hasResults = !!resultsContainer.querySelector('.search-item');
      resultsContainer.style.display = hasResults ? 'block' : 'none';
    });
  };

  // Observe les changements sur le container (ajout/suppression de résultats par SJS)
  const observer = new MutationObserver(updateVisibility);
  observer.observe(resultsContainer, { childList: true, subtree: true });

  // Met à jour à chaque frappe
  searchInput.addEventListener('input', updateVisibility);
})();