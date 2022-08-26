/**
 * Bootstrap Table Chinese translation
 * Author: Zhixin Wen<wenzhixin2010@gmail.com>
 */
$.fn.bootstrapTable.locales['zh-CN'] = {
  formatShowSearch: function formatShowSearch() {
    return 'hide/show search';
  },
  formatPageGo: function formatPageGo() {
    return 'jump';
  },
  formatCopyRows: function formatCopyRows() {
    return 'copy row';
  },
  formatPrint: function formatPrint() {
    return 'print';
  },
  formatLoadingMessage: function formatLoadingMessage() {
    return 'loading...';
  },
  formatRecordsPerPage: function formatRecordsPerPage(pageNumber) {
    return "one page shows ".concat(pageNumber, " records");
  },
  formatShowingRows: function formatShowingRows(pageFrom, pageTo, totalRows, totalNotFiltered) {
    if (totalNotFiltered !== undefined && totalNotFiltered > 0 && totalNotFiltered > totalRows) {
      return "show ".concat(pageFrom, " to ").concat(pageTo, " records,total ").concat(totalRows, " records（to ").concat(totalNotFiltered, " filter in total records）");
    }
    return "show ".concat(pageFrom, " to ").concat(pageTo, " records,total ").concat(totalRows, " records");
  },
  formatSRPaginationPreText: function formatSRPaginationPreText() {
    return 'last page';
  },
  formatSRPaginationPageText: function formatSRPaginationPageText(page) {
    return "".concat(page, "page");
  },
  formatSRPaginationNextText: function formatSRPaginationNextText() {
    return 'next page';
  },
  formatDetailPagination: function formatDetailPagination(totalRows) {
    return "total ".concat(totalRows, " records");
  },
  formatClearSearch: function formatClearSearch() {
    return 'empty filter';
  },
  formatSearch: function formatSearch() {
    return 'search';
  },
  formatNoMatches: function formatNoMatches() {
    return 'No matching records found';
  },
  formatPaginationSwitch: function formatPaginationSwitch() {
    return 'hide/show pages';
  },
  formatPaginationSwitchDown: function formatPaginationSwitchDown() {
    return 'show pages';
  },
  formatPaginationSwitchUp: function formatPaginationSwitchUp() {
    return 'hide pages';
  },
  formatRefresh: function formatRefresh() {
    return 'refresh';
  },
  formatToggle: function formatToggle() {
    return 'switch';
  },
  formatToggleOn: function formatToggleOn() {
    return 'show card view';
  },
  formatToggleOff: function formatToggleOff() {
    return 'hide card view';
  },
  formatColumns: function formatColumns() {
    return 'line';
  },
  formatColumnsToggleAll: function formatColumnsToggleAll() {
    return 'switch all';
  },
  formatFullscreen: function formatFullscreen() {
    return 'full screen';
  },
  formatAllRows: function formatAllRows() {
    return 'all';
  },
  formatAutoRefresh: function formatAutoRefresh() {
    return 'auto refresh';
  },
  formatExport: function formatExport() {
    return 'export data';
  },
  formatJumpTo: function formatJumpTo() {
    return 'jump';
  },
  formatAdvancedSearch: function formatAdvancedSearch() {
    return 'advanced search';
  },
  formatAdvancedCloseButton: function formatAdvancedCloseButton() {
    return 'close';
  },
  formatFilterControlSwitch: function formatFilterControlSwitch() {
    return 'hide/show filter control';
  },
  formatFilterControlSwitchHide: function formatFilterControlSwitchHide() {
    return 'hide filter control';
  },
  formatFilterControlSwitchShow: function formatFilterControlSwitchShow() {
    return 'show filter control';
  }
};
$.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['zh-CN']);
