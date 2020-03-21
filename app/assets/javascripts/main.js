const ratio = 0
const options = {
    root: null,
    rootMargin: '10px',
    threshold: ratio
}

const handleIntersect = function (entries, observer) {
    entries.forEach(function (entry) {
        if (entry.intersectionRatio > ratio ) {
            entry.target.classList.add('fadeInUp')
            observer.unobserve(entry.target)
        }
    })
}

const observer = new IntersectionObserver(handleIntersect, options);
console.log(document.querySelectorAll(".animated"))
document.querySelectorAll(".animated").forEach (function (r) {
    observer.observe(r);
});
