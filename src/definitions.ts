export interface GoGetterPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
