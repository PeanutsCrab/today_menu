import { Application } from '@hotwired/stimulus';
import AutocompleteController from './autocomplete_controller'; // カスタムコントローラーを読み込み

const application = Application.start();
application.register('autocomplete', AutocompleteController); // カスタムコントローラーを登録

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };