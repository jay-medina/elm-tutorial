declare module 'json-server' {
  interface ServerOptions {}

  interface Router {}

  interface Server {
    use: (defaults?: ServerOptions) => void;
    listen: (port: number) => void;
  }

  interface JSONServer {
    create: () => Server;
    defaults: () => ServerOptions;
    router: (route: string) => Router;
  }

  const JsonServer: JSONServer;

  export = JsonServer;
}
