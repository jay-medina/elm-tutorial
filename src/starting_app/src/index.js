import 'ace-css/css/ace.css';
import 'font-awesome/css/font-awesome.css';

import './index.html';

// @ts-ignore
import Main from './Main.elm';

console.log(Main);
const mountNode = document.getElementById('main');

const app = Main.embed(mountNode);
