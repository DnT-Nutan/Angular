import { enableProdMode } from '@angular/core';
import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';

import { AppModule } from './app/app.module';
import { environment } from './environments/environment';

if (environment.production) {
  enableProdMode();
}

document.addEventListener('DOMContentLoaded', () => {
  const bootstrapPromise =  platformBrowserDynamic().bootstrapModule(AppModule);
  // Logging bootstrap information
  bootstrapPromise.then(() => console.log(`Bootstrap success`))
    .catch(err => console.error(err));
});
