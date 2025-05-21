// Add click animation to skill cards
document.querySelectorAll('.skill-card').forEach(card => {
    card.addEventListener('click', () => {
        card.style.animation = 'none';
        card.offsetHeight; // Trigger reflow
        card.style.animation = 'bounce 0.5s ease';
    });
});

// Smooth scroll for navigation links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
}); 