const { contextBridge, ipcRenderer} = require('electron')

contextBridge.exposeInMainWorld(
    'electron',
    {
        close: () => ipcRenderer.send('close'),
        minimize: () => ipcRenderer.send('minimize'),
        
        dlLuvix: () => ipcRenderer.send('dlLuvix'),
        rmLuvix: () => ipcRenderer.send('rmLuvix'),
        rpLuvix: () => ipcRenderer.send('rpLuvix')
    }
)