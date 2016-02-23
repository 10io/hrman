/* global App $ history */
App.showModal = function (body, url, cancelUrl) {
  $('#modal').replaceWith(body);

  $('#modal').off('shown.bs.modal').on('shown.bs.modal', function () {
    history.pushState(null, null, url);
  });

  $('#modal').off('hidden.bs.modal').on('hidden.bs.modal', function () {
    history.pushState(null, null, cancelUrl);
  });

  $(window).off('popstate').on('popstate', function () {
    $('.modal').modal('hide');
  });

  $('#modal').modal('show');
};
