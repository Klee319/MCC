import {renderSchematic} from "@enginehub/schematicwebviewer";


renderSchematic(document.querySelector('#schematicRenderer'), './oldcastle.schem', {
    renderArrow: true,
    renderBars: true,
    corsBypassUrl: './client.jar',
});
