const suggestions = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Grape',
    'Lemon',
    'Mango',
    'Orange',
    'Peach',
    'Pear',
    'Pineapple',
    'Strawberry',
    'Watermelon'
];

const input = document.getElementById('autocomplete-input');
const resultsList = document.getElementById('autocomplete-results');

input.addEventListener('input', debounce(handleInput, 300));

function handleInput() {
    const query = input.value.trim().toLowerCase();

    const filteredSuggestions = suggestions.filter(item =>
        item.toLowerCase().includes(query)
    );

    displayResults(filteredSuggestions);
}

function displayResults(filteredSuggestions) {
    clearResults();

    if (filteredSuggestions.length === 0) {
        return;
    }

    filteredSuggestions.forEach(item => {
        const li = document.createElement('li');
        li.textContent = item;
        li.addEventListener('click', () => {
            input.value = item;
            clearResults();
        });
        resultsList.appendChild(li);
    });
}

function clearResults() {
    resultsList.innerHTML = '';
}

function debounce(func, wait) {
    let timeout;
    return function () {
        clearTimeout(timeout);
        timeout = setTimeout(() => func.apply(this, arguments), wait);
    };
}
