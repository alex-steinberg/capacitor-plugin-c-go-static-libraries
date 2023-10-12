import { registerPlugin } from '@capacitor/core';

import type { GoGetterPlugin } from './definitions';

const GoGetter = registerPlugin<GoGetterPlugin>('GoGetter', {
  web: () => import('./web').then(m => new m.GoGetterWeb()),
});

export * from './definitions';
export { GoGetter };
