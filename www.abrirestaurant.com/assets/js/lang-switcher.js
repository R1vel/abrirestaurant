// Active le bon lien selon la langue courante
document.addEventListener('DOMContentLoaded', function() {
    const path = window.location.pathname;
    const langLinks = document.querySelectorAll('.lang-switcher a');
    
    langLinks.forEach(link => {
        if ((path.includes('/fr/') && link.getAttribute('hreflang') === 'fr') ||
            (path.includes('/en/') && link.getAttribute('hreflang') === 'en')) {
            link.classList.add('active');
        }
    });

    // Mettre à jour les liens pour pointer vers la bonne page dans l'autre langue
    const currentPage = path.split('/').pop() || 'index.html';
    langLinks.forEach(link => {
        const base = link.getAttribute('hreflang') === 'fr' ? '/fr/' : '/en/';
        const pageName = currentPage === 'la-carte.html' && base === '/en/' ? 'menu.html' : currentPage;
        link.href = base + pageName;
    });
});