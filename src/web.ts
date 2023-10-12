import { WebPlugin } from '@capacitor/core';

import type { GoGetterPlugin } from './definitions';

export class GoGetterWeb extends WebPlugin implements GoGetterPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
