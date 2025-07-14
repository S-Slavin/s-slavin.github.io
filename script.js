// Portfolio JavaScript functionality

// Resume Print Handler
function handleResumePrint() {
  window.open('./resume-print.html', '_blank');
}

// Mobile menu toggle functionality
function initMobileMenu() {
  const mobileMenuToggle = document.querySelector('.mobile-menu-toggle');
  const navLinks = document.querySelector('.nav-links');
  
  if (mobileMenuToggle && navLinks) {
    mobileMenuToggle.addEventListener('click', function() {
      navLinks.classList.toggle('active');
      // Change menu icon
      this.textContent = navLinks.classList.contains('active') ? '✕' : '☰';
    });
    
    // Close menu when clicking on a link
    const mobileNavLinks = navLinks.querySelectorAll('.nav-link');
    mobileNavLinks.forEach(link => {
      link.addEventListener('click', function() {
        navLinks.classList.remove('active');
        mobileMenuToggle.textContent = '☰';
      });
    });
    
    // Close menu when clicking outside
    document.addEventListener('click', function(e) {
      if (!navLinks.contains(e.target) && !mobileMenuToggle.contains(e.target)) {
        navLinks.classList.remove('active');
        mobileMenuToggle.textContent = '☰';
      }
    });
  }
}

// Smooth scrolling for navigation links
document.addEventListener('DOMContentLoaded', function() {
  // Initialize mobile menu
  initMobileMenu();
  
  // Get all navigation links
  const navLinks = document.querySelectorAll('.nav-link[href^="#"]');
  
  // Add click event listeners
  navLinks.forEach(link => {
    link.addEventListener('click', function(e) {
      e.preventDefault();
      
      const targetId = this.getAttribute('href');
      const targetSection = document.querySelector(targetId);
      
      if (targetSection) {
        targetSection.scrollIntoView({
          behavior: 'smooth',
          block: 'start'
        });
      }
    });
  });
  
  // Active navigation highlighting
  const sections = document.querySelectorAll('section[id]');
  const navItems = document.querySelectorAll('.nav-link[href^="#"]');
  
  window.addEventListener('scroll', function() {
    let current = '';
    
    sections.forEach(section => {
      const sectionTop = section.offsetTop;
      const sectionHeight = section.clientHeight;
      
      if (pageYOffset >= sectionTop - 200) {
        current = section.getAttribute('id');
      }
    });
    
    navItems.forEach(item => {
      item.classList.remove('active');
      if (item.getAttribute('href') === `#${current}`) {
        item.classList.add('active');
      }
    });
  });
});

// Skill button interactions
document.addEventListener('DOMContentLoaded', function() {
  const skillButtons = document.querySelectorAll('.skill-btn');
  
  skillButtons.forEach(button => {
    button.addEventListener('click', function() {
      // Add a subtle animation effect
      this.style.transform = 'scale(0.95)';
      setTimeout(() => {
        this.style.transform = 'scale(1)';
      }, 150);
    });
  });
});

// Project card hover effects
document.addEventListener('DOMContentLoaded', function() {
  const projectCards = document.querySelectorAll('.project-card');
  
  projectCards.forEach(card => {
    card.addEventListener('mouseenter', function() {
      this.style.transform = 'translateY(-5px)';
    });
    
    card.addEventListener('mouseleave', function() {
      this.style.transform = 'translateY(0)';
    });
  });
});

// GitHub link tracking (optional analytics)
function trackGitHubClick(projectName) {
  // This could be used for analytics tracking
  console.log(`GitHub link clicked for project: ${projectName}`);
}

// Add click tracking to GitHub links
document.addEventListener('DOMContentLoaded', function() {
  const githubLinks = document.querySelectorAll('.github-link');
  
  githubLinks.forEach(link => {
    link.addEventListener('click', function() {
      const projectCard = this.closest('.project-card');
      const projectName = projectCard ? projectCard.querySelector('h3').textContent : 'Unknown Project';
      trackGitHubClick(projectName);
    });
  });
}); 