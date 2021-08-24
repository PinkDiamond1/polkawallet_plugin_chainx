import "@babel/polyfill"
import { ApiPromise } from "@polkadot/api"
import { WsProvider } from "@polkadot/rpc-provider"
import { options } from "@chainx-v2/api"
import { subscribeMessage, getNetworkConst, getNetworkProperties } from "./service/setting"
import { genLinks } from "./utils/config/config"
import keyring from "./service/keyring"
import account from "./service/account"
import staking from "./service/staking"
import gov from "./service/gov"

// send message to JSChannel: PolkaWallet
function send(path: string, data: any) {
  if (window.location.href.match("https://localhost:8080/")) {
    PolkaWallet.postMessage(JSON.stringify({ path, data }))
  } else {
    console.log(path, data)
  }
}
send("log", "chainx main js loaded")
;(<any>window).send = send

async function connect(nodes: string[]) {
  return new Promise(async (resolve, reject) => {
    const wsProvider = new WsProvider(nodes)
    try {
      const res = await ApiPromise.create(options({ provider: wsProvider }))
      ;(<any>window).api = res
      send("log", res)      
      await res.isReady
      console.log(res);
      const url = nodes[(<any>res)._options.provider.__private_106_endpointIndex]
      send("log", `${url} wss connected success`)
      resolve(url)
    } catch (err) {
      send("log", `connect failed`)
      wsProvider.disconnect()
      resolve(null)
    }
  })
}

const test = async () => {
  // const props = await api.rpc.system.properties();
  // send("log", props);
};

const settings = {
  test,
  connect,
  subscribeMessage,
  getNetworkConst,
  getNetworkProperties,
  // generate external links to polkascan/subscan/polkassembly...
  genLinks,
};

;(<any>window).settings = settings
;(<any>window).keyring = keyring
;(<any>window).account = account
;(<any>window).staking = staking
;(<any>window).gov = gov

// walletConnect supporting is not ready.
// ;(<any>window).walletConnect = wc

export default settings;