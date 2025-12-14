function copyClip() {
    const text = document.querySelector('.copy').innerText;
    navigator.clipboard.writeText(text);

    const icon = document.getElementById('copyicon');
    icon.className = 'nf-fa-check';

    setTimeout(() => {
        icon.className = 'nf-fa-copy';
    }, 1000);
}