import { SplashScreen } from '@capacitor/splash-screen';
import { Camera } from '@capacitor/camera';
import { GoGetter } from "../../../src";

window.customElements.define('capacitor-welcome', class extends HTMLElement {
    constructor() {
        super();

        SplashScreen.hide();

        const root = this.attachShadow({ mode: 'open' });

        const getEcho = async () => {
            console.log('========> clicked')
            const inputValue = root.getElementById("echo").value;
            console.log({inputValue})
            const res = await GoGetter.echo({value: inputValue})
            console.log({res})
            root.getElementById("echoed-back").innerHTML = res.value
        }

        root.innerHTML = `
    <style>
      :host {
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
        display: block;
        width: 100%;
        height: 100%;
      }
      h1, h2, h3, h4, h5 {
        text-transform: uppercase;
      }
      .button {
        display: inline-block;
        padding: 10px;
        background-color: #73B5F6;
        color: #fff;
        font-size: 0.9em;
        border: 0;
        border-radius: 3px;
        text-decoration: none;
        cursor: pointer;
      }
      main {
        padding: 15px;
      }
      main hr { height: 1px; background-color: #eee; border: 0; }
      main h1 {
        font-size: 1.4em;
        text-transform: uppercase;
        letter-spacing: 1px;
      }
      main h2 {
        font-size: 1.1em;
      }
      main h3 {
        font-size: 0.9em;
      }
      main p {
        color: #333;
      }
      main pre {
        white-space: pre-line;
      }
    </style>
    <div>
      <capacitor-welcome-titlebar>
        <h1>Go Getter</h1>
      </capacitor-welcome-titlebar>
      <main>
        <label for="echo">What would you like to echo?</label>
        <input type="text" name="echo" id="echo">
        <button id="getEchoButton">Get echo</button>
        <p>Echoed back: <span id="echoed-back"></span></p>
      </main>
    </div>
    `;

        root.querySelector('#getEchoButton').addEventListener('click', getEcho);
    }


});

window.customElements.define(
  'capacitor-welcome-titlebar',
  class extends HTMLElement {
    constructor() {
      super();
      const root = this.attachShadow({ mode: 'open' });
      root.innerHTML = `
    <style>
      :host {
        position: relative;
        display: block;
        padding: 15px 15px 15px 15px;
        text-align: center;
        background-color: #73B5F6;
      }
      ::slotted(h1) {
        margin: 0;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
        font-size: 0.9em;
        font-weight: 600;
        color: #fff;
      }
    </style>
    <slot></slot>
    `;
    }
  }
);
