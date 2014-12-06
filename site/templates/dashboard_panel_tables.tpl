      <div class="templatemo-content-wrapper">
        <div class="templatemo-content">
          [[[page:breadcrumb(["Admin Panel", "Manage Users", {active, "Tables"}])]]]
          <h1>Manage Users</h1>
          <p>Here goes tables and users.</p>
          <div class="row margin-bottom-30">
            <div class="col-md-12">
              <ul class="nav nav-pills">
                <li class="active"><a href="#">New Users <span class="badge">42</span></a></li>
                <li><a href="#">Active Users <span class="badge">107</span></a></li>
                <li><a href="#">Expired Users <span class="badge">3</span></a></li>
              </ul>          
            </div>
          </div> 
          <div class="row">
            <div class="col-md-12">
              <div class="btn-group pull-right" id="templatemo_sort_btn">
                <button type="button" class="btn btn-default">Sort by</button>
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                  <span class="caret"></span>
                  <span class="sr-only">Toggle Dropdown</span>
                </button>
               [[[page:dropdown_menu(["First Name","Last Name","Username"])]]]
              </div>
              <div class="table-responsive">
                <h4 class="margin-bottom-15">New Users Table</h4>
                [[[page:table_block()]]]
                [[[page:pagination_block()]]]
              </div>
              </ul>  
            </div>
          </div>
        </div>
      </div>