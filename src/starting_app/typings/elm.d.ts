declare module '*.elm' {
  interface Main {
    embed(node: HTMLElement): any;
    fullscreen(): void;
  }

  const Main: Main;

  export { Main };
}
