SimpleJekyllSearch({
    searchInput: document.getElementById('search-input'),
    resultsContainer: document.getElementById('results-container'),
    json: '/search.json',
    searchResultTemplate: `
      <li class="search-item">
        <a class="search-item-link" href="{url}" title="{title}">
          <p class="search-item-title">{title}</p>
          <p class="search-description">{description}</p>
        </a>
      </li>
    `,
    noResultsText: 'Aucun résultat trouvé',
    fuzzy: false,
    limit: 10,
    templateMiddleware: function(prop, value, template) {
      const query = document.getElementById('search-input').value;
      if (prop === "title" || prop === "description") {
        return highlight(value, query);
      }
      return value;
    }
  });

  function highlight(text, query) {
    if (!query) return text;
    const pattern = new RegExp(`(${query})`, "gi");
    return text.replace(pattern, '<mark>$1</mark>');
  }