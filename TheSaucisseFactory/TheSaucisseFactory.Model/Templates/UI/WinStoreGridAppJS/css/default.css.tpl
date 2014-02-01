﻿html {
    cursor: default;
}

#contenthost {
    height: 100%;
    width: 100%;
    background: [%=Producer.AppBackgroundColor%];
}

.win-appbar {
	background-color: [%=Producer.AppBarBackgroundColor%];
}

.hide {
    display: none;
}

.win-listview :not(.win-footprint).win-container {
    /* Override default background for win-container (background-color:rgb(29, 29, 29);) */
    background-color: transparent;
}

.fragment {
    /* Define a grid with rows for a banner and a body */
    -ms-grid-columns: 1fr;
    -ms-grid-rows: 128px 1fr 0px;
    display: -ms-grid;
    height: 100%;
    width: 100%;
}

    .fragment header[role=banner] {
        /* Define a grid with columns for the back button and page title. */
        -ms-grid-columns: 120px 1fr;
        -ms-grid-rows: 1fr;
        display: -ms-grid;
    }

        .fragment header[role=banner] .win-backbutton {
            margin-left: 39px;
            margin-top: 59px;
        }

        .fragment header[role=banner] .titlearea {
            -ms-grid-column: 2;
            margin-top: 37px;
        }

            .fragment header[role=banner] .titlearea .pagetitle {
                width: calc(100% - 20px);
            }

    .fragment section[role=main] {
        -ms-grid-row: 2;
        height: 100%;
        width: 100%;
    }

@media screen and (-ms-view-state: snapped) {
    .fragment header[role=banner] {
        -ms-grid-columns: auto 1fr;
        margin-left: 20px;
    }

        .fragment header[role=banner] .win-backbutton {
            margin: 0;
            margin-right: 10px;
            margin-top: 76px;
        }

            .fragment header[role=banner] .win-backbutton:disabled {
                display: none;
            }

        .fragment header[role=banner] .titlearea {
            -ms-grid-column: 2;
            margin-left: 0;
            margin-top: 68px;
        }
}

@media screen and (-ms-view-state: fullscreen-portrait) {
    .fragment header[role=banner] {
        -ms-grid-columns: 100px 1fr;
    }

        .fragment header[role=banner] .win-backbutton {
            margin-left: 29px;
        }
}
