<link rel="stylesheet" href="https://unpkg.com/placeholder-loading/dist/css/placeholder-loading.min.css">
<style>
tr:hover {
    cursor: pointer;
    background: #e3eaef;
}

.MYbounce {
    position: fixed;
    left: 0;
    top: 10%;
    right: 0;
    margin: auto;
    display: none;
    padding: 10px;
    width: 300px;
    border-radius: 5px;
    z-index: 99999;
}

.fab {
    position: fixed;
    width: 56px;
    left: 95%;
    bottom: 15px;
    margin-left: -28px;
    z-index: 999999;
    display: none;
}

.fab:hover .fab-buttons {
    opacity: 1;
    visibility: visible;
}

.fab:hover .fab-buttons__link {
    transform: scaleY(1) scaleX(1) translateY(-16px) translateX(0px);
}

.fab-action-button:hover+.fab-buttons .fab-buttons__link:before {
    visibility: visible;
    opacity: 1;
    transform: scale(1);
    transform-origin: right center 0;
    transition-delay: 0.3s;
}

.fab-action-button {
    position: absolute;
    bottom: 0;
    display: block;
    width: 56px;
    height: 56px;
    background-color: #02c39a;
    border-radius: 50%;
    box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0 rgba(0, 0, 0, 0.12), 0 3px 1px -2px rgba(0, 0, 0, 0.2);
}

.fab-buttons {
    position: absolute;
    left: 0;
    right: 0;
    bottom: 50px;
    list-style: none;
    margin: 0;
    padding: 0;
    opacity: 0;
    visibility: hidden;
    transition: 0.2s;
}

.fab-action-button__icon {
    display: inline-block;
    width: 56px;
    height: 56px;
    background: url("data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjZmZmZmZmIiBoZWlnaHQ9IjI0IiB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik0wIDBoMjR2MjRIMHoiIGZpbGw9Im5vbmUiLz4KICAgIDxwYXRoIGQ9Ik0xOCAxNi4wOGMtLjc2IDAtMS40NC4zLTEuOTYuNzdMOC45MSAxMi43Yy4wNS0uMjMuMDktLjQ2LjA5LS43cy0uMDQtLjQ3LS4wOS0uN2w3LjA1LTQuMTFjLjU0LjUgMS4yNS44MSAyLjA0LjgxIDEuNjYgMCAzLTEuMzQgMy0zcy0xLjM0LTMtMy0zLTMgMS4zNC0zIDNjMCAuMjQuMDQuNDcuMDkuN0w4LjA0IDkuODFDNy41IDkuMzEgNi43OSA5IDYgOWMtMS42NiAwLTMgMS4zNC0zIDNzMS4zNCAzIDMgM2MuNzkgMCAxLjUtLjMxIDIuMDQtLjgxbDcuMTIgNC4xNmMtLjA1LjIxLS4wOC40My0uMDguNjUgMCAxLjYxIDEuMzEgMi45MiAyLjkyIDIuOTIgMS42MSAwIDIuOTItMS4zMSAyLjkyLTIuOTJzLTEuMzEtMi45Mi0yLjkyLTIuOTJ6Ii8+Cjwvc3ZnPg==") center no-repeat;
}

.fab-buttons__item {
    display: block;
    text-align: center;
    margin: 12px 0;
}

.fab-buttons__link {
    display: inline-block;
    width: 40px;
    height: 40px;
    padding-top: 9px;
    text-decoration: none;
    background-color: #ffffff;
    border-radius: 50%;
    box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0 rgba(0, 0, 0, 0.12), 0 3px 1px -2px rgba(0, 0, 0, 0.2);
    transform: scaleY(0.5) scaleX(0.5) translateY(0px) translateX(0px);
    -moz-transition: .3s;
    -webkit-transition: .3s;
    -o-transition: .3s;
    transition: .3s;
}

[data-tooltip]:before {
    top: 50%;
    margin-top: -15px;
    border-radius: 50px;
    background: #343a40;
    color: #fff;
    font-family: 'Nunito', sans-serif;
    font-weight: 700;
    content: attr(data-tooltip);
    font-size: 12px;
    text-decoration: none;
    visibility: hidden;
    opacity: 0;
    padding: 1px 12px;
    margin-right: 12px;
    position: absolute;
    transform: scale(0);
    right: 100%;
    white-space: nowrap;
    transform-origin: top right;
    transition: all .3s cubic-bezier(.25, .8, .25, 1);
}

[data-tooltip]:hover:before {
    visibility: visible;
    opacity: 1;
    transform: scale(1);
    transform-origin: right center 0;
}

.icon-material {
    display: inline-block;
    width: 40px;
    height: 40px;
}

.icon-material_fb {
    background: url("data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTYuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgd2lkdGg9IjE2cHgiIGhlaWdodD0iMTZweCIgdmlld0JveD0iMCAwIDUxMCA1MTAiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMCA1MTA7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4KPGc+Cgk8ZyBpZD0icG9zdC1mYWNlYm9vayI+CgkJPHBhdGggZD0iTTQ1OSwwSDUxQzIyLjk1LDAsMCwyMi45NSwwLDUxdjQwOGMwLDI4LjA1LDIyLjk1LDUxLDUxLDUxaDQwOGMyOC4wNSwwLDUxLTIyLjk1LDUxLTUxVjUxQzUxMCwyMi45NSw0ODcuMDUsMCw0NTksMHogICAgIE00MzMuNSw1MXY3Ni41aC01MWMtMTUuMywwLTI1LjUsMTAuMi0yNS41LDI1LjV2NTFoNzYuNXY3Ni41SDM1N1Y0NTloLTc2LjVWMjgwLjVoLTUxVjIwNGg1MXYtNjMuNzUgICAgQzI4MC41LDkxLjgsMzIxLjMsNTEsMzY5Ljc1LDUxSDQzMy41eiIgZmlsbD0iIzc1NzU3NSIvPgoJPC9nPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+Cjwvc3ZnPgo=") center no-repeat;
}

.icon-material_gp {
    background: url("data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTYuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgd2lkdGg9IjE2cHgiIGhlaWdodD0iMTZweCIgdmlld0JveD0iMCAwIDUxMCA1MTAiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMCA1MTA7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4KPGc+Cgk8ZyBpZD0icG9zdC1ncGx1cyI+CgkJPHBhdGggZD0iTTIzNC42LDE3NS45NWMwLTI1LjUtMTUuMy03Ni41LTUzLjU1LTc2LjVjLTE1LjMsMC0zMy4xNSwxMC4yLTMzLjE1LDQzLjM1YzAsMzAuNiwxNS4zLDczLjk1LDUxLDczLjk1ICAgIEMxOTguOSwyMTYuNzUsMjM0LjYsMjE0LjIsMjM0LjYsMTc1Ljk1eiBNMjE5LjMsMzAwLjljLTIuNTUsMC01LjEsMC03LjY1LDBsMCwwYy03LjY1LDAtMzAuNiwyLjU1LTQ1LjksNy42NDkgICAgQzE0Ny45LDMxMy42NSwxMjcuNSwzMjYuNCwxMjcuNSwzNTEuOWMwLDI4LjA1LDI1LjUsNTYuMSw3Ni41LDU2LjFjMzguMjUsMCw2MS4yLTI1LjUsNjEuMi01MSAgICBDMjY1LjIsMzM5LjE1LDI1Mi40NSwzMjYuNCwyMTkuMywzMDAuOXogTTQ1OSwwSDUxQzIyLjk1LDAsMCwyMi45NSwwLDUxdjQwOGMwLDI4LjA1LDIyLjk1LDUxLDUxLDUxaDQwOGMyOC4wNSwwLDUxLTIyLjk1LDUxLTUxICAgIFY1MUM1MTAsMjIuOTUsNDg3LjA1LDAsNDU5LDB6IE0xODEuMDUsNDM4LjZjLTcxLjQsMC0xMDQuNTUtNDAuOC0xMDQuNTUtNzYuNWMwLTEyLjc1LDIuNTUtNDAuOCwzOC4yNS02MS4xOTkgICAgYzIwLjQtMTIuNzUsNDUuOS0yMC40LDc5LjA1LTIyLjk1Yy01LjEtNS4xMDEtNy42NS0xMi43NS03LjY1LTI1LjVjMC01LjEsMC03LjY1LDIuNTUtMTIuNzVoLTEwLjJjLTUxLDAtODEuNi0zOC4yNS04MS42LTc2LjUgICAgYzAtNDMuMzUsMzMuMTUtOTEuOCwxMDQuNTUtOTEuOGgxMDcuMWwtNy42NDksNy42NUwyODMuMDUsOTYuOWwtMi41NSwyLjU1aC0xNy44NWMxMC4xOTksMTAuMiwyMi45NDksMjguMDUsMjIuOTQ5LDU2LjEgICAgYzAsMzUuNy0xNy44NSw1My41NS00MC44LDY4Ljg1Yy01LjEsMi41NS0xMC4yLDEwLjItMTAuMiwxNy44NXM1LjEsMTIuNzUsMTAuMiwxNS4zYzIuNTUsMi41NSw3LjY1LDUuMTAxLDEyLjc1LDcuNjUgICAgYzIwLjQsMTUuMyw0OC40NSwzMy4xNDksNDguNDUsNzMuOTVDMzA2LDM4NS4wNSwyNzIuODUsNDM4LjYsMTgxLjA1LDQzOC42eiBNNDMzLjUsMjU1aC01MXY1MUgzNTd2LTUxaC01MXYtMjUuNWg1MXYtNTFoMjUuNXY1MSAgICBoNTFWMjU1eiIgZmlsbD0iIzc1NzU3NSIvPgoJPC9nPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+Cjwvc3ZnPgo=") center no-repeat;
}

.icon-material_tw {
    background: url("data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTYuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgd2lkdGg9IjE2cHgiIGhlaWdodD0iMTZweCIgdmlld0JveD0iMCAwIDUxMCA1MTAiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMCA1MTA7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4KPGc+Cgk8ZyBpZD0icG9zdC10d2l0dGVyIj4KCQk8cGF0aCBkPSJNNDU5LDBINTFDMjIuOTUsMCwwLDIyLjk1LDAsNTF2NDA4YzAsMjguMDUsMjIuOTUsNTEsNTEsNTFoNDA4YzI4LjA1LDAsNTEtMjIuOTUsNTEtNTFWNTFDNTEwLDIyLjk1LDQ4Ny4wNSwwLDQ1OSwweiAgICAgTTQwMC4zNSwxODYuMTVjLTIuNTUsMTE3LjMtNzYuNSwxOTguOS0xODguNywyMDRDMTY1Ljc1LDM5Mi43LDEzMi42LDM3Ny40LDEwMiwzNTkuNTVjMzMuMTUsNS4xMDEsNzYuNS03LjY0OSw5OS40NS0yOC4wNSAgICBjLTMzLjE1LTIuNTUtNTMuNTUtMjAuNC02My43NS00OC40NWMxMC4yLDIuNTUsMjAuNCwwLDI4LjA1LDBjLTMwLjYtMTAuMi01MS0yOC4wNS01My41NS02OC44NWM3LjY1LDUuMSwxNy44NSw3LjY1LDI4LjA1LDcuNjUgICAgYy0yMi45NS0xMi43NS0zOC4yNS02MS4yLTIwLjQtOTEuOGMzMy4xNSwzNS43LDczLjk1LDY2LjMsMTQwLjI1LDcxLjRjLTE3Ljg1LTcxLjQsNzkuMDUxLTEwOS42NSwxMTcuMzAxLTYxLjIgICAgYzE3Ljg1LTIuNTUsMzAuNi0xMC4yLDQzLjM1LTE1LjNjLTUuMSwxNy44NS0xNS4zLDI4LjA1LTI4LjA1LDM4LjI1YzEyLjc1LTIuNTUsMjUuNS01LjEsMzUuNy0xMC4yICAgIEM0MjUuODUsMTY1Ljc1LDQxMy4xLDE3NS45NSw0MDAuMzUsMTg2LjE1eiIgZmlsbD0iIzc1NzU3NSIvPgoJPC9nPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+Cjwvc3ZnPgo=") center no-repeat;
}

.icon-material_li {
    background: url("data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTYuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgd2lkdGg9IjE2cHgiIGhlaWdodD0iMTZweCIgdmlld0JveD0iMCAwIDUxMCA1MTAiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMCA1MTA7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4KPGc+Cgk8ZyBpZD0icG9zdC1saW5rZWRpbiI+CgkJPHBhdGggZD0iTTQ1OSwwSDUxQzIyLjk1LDAsMCwyMi45NSwwLDUxdjQwOGMwLDI4LjA1LDIyLjk1LDUxLDUxLDUxaDQwOGMyOC4wNSwwLDUxLTIyLjk1LDUxLTUxVjUxQzUxMCwyMi45NSw0ODcuMDUsMCw0NTksMHogICAgIE0xNTMsNDMzLjVINzYuNVYyMDRIMTUzVjQzMy41eiBNMTE0Ljc1LDE2MC42NWMtMjUuNSwwLTQ1LjktMjAuNC00NS45LTQ1LjlzMjAuNC00NS45LDQ1LjktNDUuOXM0NS45LDIwLjQsNDUuOSw0NS45ICAgIFMxNDAuMjUsMTYwLjY1LDExNC43NSwxNjAuNjV6IE00MzMuNSw0MzMuNUgzNTdWMjk4LjM1YzAtMjAuMzk5LTE3Ljg1LTM4LjI1LTM4LjI1LTM4LjI1cy0zOC4yNSwxNy44NTEtMzguMjUsMzguMjVWNDMzLjVIMjA0ICAgIFYyMDRoNzYuNXYzMC42YzEyLjc1LTIwLjQsNDAuOC0zNS43LDYzLjc1LTM1LjdjNDguNDUsMCw4OS4yNSw0MC44LDg5LjI1LDg5LjI1VjQzMy41eiIgZmlsbD0iIzc1NzU3NSIvPgoJPC9nPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+Cjwvc3ZnPgo=") center no-repeat;
}

thead tr {
    background: #e3eaef;
}

thead tr:hover {
    background: #e3eaef;
}

thead tr td:hover {
    opacity: 0.8;
    color: #223;
}

/* width */
#scroll-jenis-file::-webkit-scrollbar {
    width: 4px;
}

/* Track */
#scroll-jenis-file::-webkit-scrollbar-track {
    background: #f1f1f1;
}

/* Handle */
#scroll-jenis-file::-webkit-scrollbar-thumb {
    border-radius: 50px;
    background: #02c39a;
}

/* Handle on hover */
#scroll-jenis-file::-webkit-scrollbar-thumb:hover {
    background: #444;
}

.select2-selection__rendered {
    line-height: 37px !important;
}

.select2-container .select2-selection--single {
    height: 27px !important;

}

.select2-selection__arrow {
    height: 27px !important;
}
</style>

<br /><br />
<div class="container">
    <?= form_open(base_url('dokumen-saya/action')) ?>
    <!-- FAB -->
    <div class="fab">
        <div class="fab-action-button text-center" style="padding-top:15.8px">
            <i class="fas fa-bars text-white" style="font-size:23px;"></i>
        </div>
        <ul class="fab-buttons">
            <li class="fab-buttons__item">
                <button type='submit' name='button-options' value='unduh'
                    class="no-border fab-buttons__link text-center" id="fab-unduh" data-tooltip="Unduh">
                    <i class="far fa-save text-size-5" style=" margin-left:0px;"></i>
                </button>
            </li>
            <li class="fab-buttons__item">
                <button type='submit' name='button-options' value='hapus'
                    class="no-border fab-buttons__link text-center" data-tooltip="Hapus">
                    <i class="far fa-trash-alt text-size-5" style="margin-left:0px;"></i>
                </button>
            </li>
            <li class="fab-buttons__item">
                <button class="no-border fab-buttons__link text-center" data-tooltip="Ubah">
                    <i class="fas fa-pencil-alt text-size-5" style="margin-left:0px;"></i>
                </button>
            </li>

        </ul>
    </div>
    <!-- /FAB -->
    <input type='hidden' readonly name='id_file' id="tampung-input" class="form-control">
    <?= form_close(); ?>


    <!-- BOUNCE -->
    <div class='MYbounce bg-danger box-shadow'>
        <h4 class="text-center montserrat-600 letter-spacing text-white text-size-5" id='text-selected '
            style="padding: 0; margin: 0;">
            <label class="text-center" id='counter-selected' style="padding: 0; margin: 0;"></label>
            Item
            terpilih
        </h4>
    </div>
    <!-- /BOUNCE -->
    <div class="row">
        <!-- Berkas -->
        <div class="col-lg-3 mt-1">
            <div class="text-size-7 nunito-600 text-dark-1 letter-spacing"><i class="far fa-folder"
                    style='font-size:19px'></i> Jenis dokumen
            </div>
            <hr />

            <div style="overflow:auto; max-height:580px" id="scroll-jenis-file">
                <ul class="list-unstyled " id="jenis-file"></ul>
            </div>
        </div>

        <div class="col-lg-9">
            <div class=" d-flex justify-content-between">
                <div class="text-size-7 nunito-600 text-dark-1 letter-spacing"><i class="far fa-file-alt"
                        style="font-size:19px"></i> Dokumen <?= @$this->session->level != 2 ? 'saya' : ''; ?>
                </div>
                <div>
                    <a href="<?= base_url('dokumen-saya/add') ?>" class="btn btn-primary btn-md"><i
                            class="fas fa-cloud-upload-alt"></i>
                        Tambah
                        Berkas</a>
                </div>

            </div>

            <hr />

            <!-- SEARCH -->
            <div class="row mb-2">
                <div class="col-lg-2">
                    <a href="#" data-toggle="dropdown" class="btn btn-light dropdown-toggle mt-4"
                        aria-expanded="true"><i class="fas fa-list-ul"></i> Tampilkan Data</a>
                    <ul class="dropdown-menu dropdown-menu-sm dropdown-menu-right" id="display-data"
                        x-placement="bottom-end"
                        style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(-124px, 31px, 0px);">
                        <li class="dropdown-title text-size-1 nunito-500">Tampilkan data</li>
                        <li><a href="#" class="dropdown-item show-data" data-val=10>10</a></li>
                        <li><a href="#" class="dropdown-item show-data" data-val=25>25</a></li>
                        <li><a href="#" class="dropdown-item show-data" data-val=50>50</a></li>
                        <li><a href="#" class="dropdown-item show-data" data-val=100>100</a></li>
                    </ul>
                    <!-- <div class="form-group">
                        <label>Tampilkan Data</label>
                        <select class="form-control selectric" id="display-data">
                            <option value="10">10</option>
                            <option value="25">25</option>
                            <option value="50">50</option>
                            <option value="100">100</option>
                            <option value="150">150</option>
                            <option value="500">500</option>
                        </select>
                    </div> -->
                </div>
                <?php if ($this->session->level == 2) { ?>

                <div class="col-lg-6">

                    <div class="float-right d-flex flex-column">
                        <label class="mb-0 text-size---1 nunito-700" for="">User</label>
                        <select class="form-control  " id='select2-user'>
                            <option class="text-center" value="">- Pilih User - </option>
                            <option value="">Semua User</option>
                            <?php foreach ($collections as $list) :
                                    $nama = ucfirst($list['nama_user']) . ' ' . $list['gelar_depan'] . ' ' . $list['gelar_belakang']; ?>
                            <option value="<?= sha1($list['id']) ?>">
                                <?= $nama . ' ' . ($list['id'] == $this->session->id_user ? "(Saya)" : ''); ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>

                <?php } else { ?>
                <div class="col-lg-2"></div>
                <div class="col-lg-4"></div>

                <?php } ?>

                <div class="col-lg-4">
                    <form action="" action='POST' autocomplete="off">
                        <label for=""></label>
                        <div class="input-group ">
                            <div class="input-group-btn">
                                <button type='button' class="btn btn-light py-2" name="btn-search"><i
                                        class="fas fa-search"></i></button>
                            </div>

                            <input type="text" class="form-control radius-right" placeholder="Cari Berkas" name="q">
                        </div>
                    </form>
                </div>
            </div>
            <!-- /SEARCH -->

            <!-- Table Files -->

            <table class="table table-striped">
                <thead>
                    <tr class="mt-0">
                        <td style="background-color:transparent !important; width:26px; "
                            class="nunito-700 letter-spacing pl-3 pr-0 ">
                            <label class='pure-material-checkbox'>
                                <input type='checkbox' id='SelectAll'>
                                <span></span>
                            </label>
                        </td>
                        <td style="background-color:transparent !important;"
                            class="nunito-700 icon-th text-size---1 letter-spacing" data-filter='up'>
                            Nama
                            <span class=' float-right'><i class="fas fa-sort-amount-down-alt"></i></span>

                        </td>
                        <td style="background-color:transparent !important; "
                            class="nunito-700 icon-th text-size---1 letter-spacing " data-filter='up'>
                            <span>Terakhir
                                Update</span>
                            <span class='float-right'><i class="fas fa-sort-amount-down-alt"></i></span>

                        </td>
                        <td style="background-color:transparent !important; "
                            class="nunito-700 icon-th text-size---1 letter-spacing" data-filter='up'>
                            <span>Tipe</span>
                            <span class='float-right'><i class="fas fa-sort-amount-down-alt"></i></span>

                        </td>
                        <td style="background-color:transparent !important; "
                            class="nunito-700 icon-th text-size---1 letter-spacing" data-filter='up'>
                            <span>Akses</span> &nbsp;
                            <span class='float-right'><i class="fas fa-sort-amount-down-alt"></i></span>
                        </td>
                        <td style="background-color:transparent !important; "
                            class="nunito-700 text-size---1 letter-spacing">
                            Opsi

                        </td>
                    </tr>
                </thead>
                <tbody id="Data">
                </tbody>
            </table>
            <!-- Table Files -->

            <div class="d-flex justify-content-between">
                <!-- COUNT -->
                <div id="count-result" class="text-weight-italic">
                    <code><span id='total-data'>0</span></code> Records data aktif<br />
                    Halaman <code><span id='page-now'>0</span></code> dari
                    <code><span id='total-page'>0</span></code>
                    halaman</div>
                <!-- /COUNT -->

                <!-- PAGINATION -->
                <div class="float-right" id="pagination"></div>
                <!-- /PAGINATION -->

            </div>

        </div>
        <!-- Berkas -->
    </div>
    <br /><br /><br />
</div>