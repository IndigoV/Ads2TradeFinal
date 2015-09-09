<style>
  table {
    border-collapse: collapse;
    border-spacing: 0;
  }

  p {
    margin: 0.75em 0;
  }
  #map-canvas-sell {
    /*height: 100%;*/
    height: 500px;
    width:1053px;
    bottom: 0;
        position: absolute;
        left: 0;
    right: 0;
    top: 0;
    max-width:none; /* fix issue with grey areas on map*/
  }
  /* left align the text and checkboxes */
  div.mapping_legend{text-align: left;}

  @media print {
    #map_canvas {
      height: 950px;
    }
  }

  .filterBtn{
    width:auto;  /* overidde input width on the filter button */
  }

  img{max-width: none !important; /* Fix broken google maps controls*/}

  .gm-style img { max-width: none; }
.gm-style label { width: auto; display: inline; }
#map-canvas img {max-width: inherit !important; max-height: inherit !important}
#map-canvas-sell img {max-width: inherit !important; max-height: inherit !important} 

</style>