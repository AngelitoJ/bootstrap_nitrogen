<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
  <title>[[[page:title()]]]</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="viewport" content="width=device-width">
  <script src="js/bootstrap.min.js"></script>
  <script src="js/Chart.min.js"></script>
  <script src="js/templatemo_script.js"></script>
  <script src="nitrogen/jquery.js"></script>
  <script src='/nitrogen/jquery-ui.min.js' type='text/javascript' charset='utf-8'></script>
  <script src='/nitrogen/livevalidation.min.js' type='text/javascript' charset='utf-8'></script>
  <script src='/nitrogen/nitrogen.min.js' type='text/javascript' charset='utf-8'></script>
  <script src='/nitrogen/bert.min.js' type='text/javascript' charset='utf-8'></script>
  <link rel="stylesheet" href="/nitrogen/jquery-ui/jquery.ui.all.css" type="text/css" media="screen" charset="utf-8" />
  <link rel="stylesheet" href="css/templatemo_main.css">
</head>
<body>
  <div class="navbar navbar-inverse" role="navigation">
      <div class="navbar-header">
        <div class="logo"><h1>[[[page:header()]]]</h1></div>
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button> 
      </div>   
    </div>
    <div class="template-page-wrapper">
      <!--/.navbar-collapse -->
      [[[page:sidebar()]]]
      [[[page:content(Content)]]]
      <!-- Modal -->
      <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
              <h4 class="modal-title" id="myModalLabel">Are you sure you want to sign out?</h4>
            </div>
            <div class="modal-footer">
              <a href="index" class="btn btn-primary">Yes</a>
              <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
            </div>
          </div>
        </div>
      </div>
      <footer class="templatemo-footer">
        <div class="templatemo-copyright">
          <p>Copyright &copy; 2084 Your Company Name <!-- Credit: www.templatemo.com --></p>
        </div>
      </footer>
    </div>
  <script type="text/javascript">
    $('#myTab a').click(function (e) {
      e.preventDefault();
      $(this).tab('show');
    });

    $('#loading-example-btn').click(function () {
      var btn = $(this);
      btn.button('loading');
      // $.ajax(...).always(function () {
      //   btn.button('reset');
      // });
  });
  </script>
  <script>
  [[[script]]]
  </script>
</body>
</html>