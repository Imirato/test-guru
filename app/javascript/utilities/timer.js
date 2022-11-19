document.addEventListener('turbolinks:load', function() {
    let timer = document.getElementById('passage_time')

    if (timer) {
        timer.addEventListener('load', passage_time)
        setInterval(passage_time, 1000)
    }
})

const update = function() {
    const updateButton = document.getElementById('next-question')

    updateButton.click()
}

const passage_time = function() {
    const timer = document.getElementById('passage_time')
    const closingTime = timer.dataset.closing_time
    const difference = +new Date(closingTime) - +new Date()
    let remaining = 'Time is up!'

    if (difference > 0) {
        const parts = [
            Math.floor((difference / (1000 * 60 * 60)) % 24),
            Math.floor((difference / 1000 / 60) % 60),
            Math.floor((difference / 1000) % 60),
        ]
        remaining = parts.map((part) => String(part).padStart(2, '0')).join(":")
    } else {
        timer.classList.add('border-danger')
        setTimeout(update, 2000)
    }

    timer.innerHTML = remaining
}
