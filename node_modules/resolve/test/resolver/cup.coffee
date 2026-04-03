const navbar = document.getElementById("navbar");

window.addEventListener("scroll", () => {
    if (window.scrollY > 50) {
        navbar.classList.add("bg-black/80", "backdrop-blur-xl", "border-b", "border-white/10");
    } else {
        navbar.classList.remove("bg-black/80", "backdrop-blur-xl", "border-b", "border-white/10");
    }
});

// Animate counters
function animateCounters() {
    const stats = [
        { id: 'stat-1', target: 2000, suffix: '+' },
        { id: 'stat-2', target: 10, suffix: '+' },
        { id: 'stat-3', target: 800, suffix: '+' },
        { id: 'stat-4', target: 150, suffix: 'M+' }
    ];
    
    stats.forEach(stat => {
        const element = document.getElementById(stat.id);
        if (!element) return;
        let current = 0;
        const increment = Math.ceil(stat.target / 60);
        
        const timer = setInterval(() => {
            current += increment;
            if (current >= stat.target) {
                current = stat.target;
                clearInterval(timer);
            }
            element.textContent = current + stat.suffix;
        }, 30);
    });
}

// Mobile menu
function setupMobileMenu() {
    const btn = document.getElementById('mobile-menu-btn');
    const menu = document.getElementById('mobile-menu');
    
    btn.addEventListener('click', () => {
        if (menu.classList.contains('hidden')) {
            menu.classList.remove('hidden');
            btn.innerHTML = `<i class="fa-solid fa-xmark text-2xl"></i>`;
        } else {
            menu.classList.add('hidden');
            btn.innerHTML = `<i class="fa-solid fa-bars text-2xl"></i>`;
        }
    });
}

// Smooth scroll
function enableSmoothScroll() {
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                e.preventDefault();
                target.scrollIntoView({ behavior: 'smooth' });
            }
        });
    });
}

// Initialize everything
window.onload = function () {
    animateCounters();
    setupMobileMenu();
    enableSmoothScroll();
    
    console.log('%c✅ Braind.ON front-end carregado com sucesso!', 'color:#00ff9f; font-family:monospace; font-size:14px');
};