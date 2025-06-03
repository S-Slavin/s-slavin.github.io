// Smooth scroll for navigation links
document.addEventListener('DOMContentLoaded', () => {
    // Handle hash links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const targetId = this.getAttribute('href');
            const targetElement = document.querySelector(targetId);
            
            if (targetElement) {
                targetElement.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
                history.pushState(null, '', targetId);
            }
        });
    });

    // Handle regular navigation links
    document.querySelectorAll('a[href]').forEach(link => {
        if (!link.getAttribute('href').startsWith('#')) {
            link.addEventListener('click', function (e) {
                // Only prevent default if it's an internal link
                if (this.hostname === window.location.hostname) {
                    e.preventDefault();
                    const href = this.getAttribute('href');
                    window.location.href = href;
                }
            });
        }
    });
}); 