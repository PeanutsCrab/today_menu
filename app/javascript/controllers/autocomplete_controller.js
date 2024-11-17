import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['input', 'results'];

  connect() {
    this.inputTarget.addEventListener('input', this.suggest.bind(this));
  }

  suggest() {
    const query = this.inputTarget.value;
    if (query.length < 2) {
      this.clearList();
      return;
    }

    const url = `${this.data.get('urlValue')}?q=${encodeURIComponent(query)}`;

    fetch(url)
      .then((response) => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then((data) => {
        this.clearList();

        if (data.length === 0) {
          this.resultsTarget.style.display = 'none';
          return;
        }

        this.resultsTarget.style.display = 'block'; // 候補がある場合リストを表示

        data.forEach((result) => {
          const item = document.createElement('li');
          item.textContent = result.label;
          item.classList.add('autocomplete-item');
          item.style.cursor = 'pointer';
          item.addEventListener('click', () => {
            this.inputTarget.value = result.value;
            this.clearList();
          });
          this.resultsTarget.appendChild(item);
        });
      })
      .catch((error) => {
        console.error('Error fetching autocomplete results:', error);
      });
  }

  clearList() {
    this.resultsTarget.innerHTML = '';
  }
}