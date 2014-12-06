      <div class="templatemo-content-wrapper">
        <div class="templatemo-content">
          <ol class="breadcrumb">
            <li><a href="dashboard">Admin Panel</a></li>
            <li><a href="#">Manage Users</a></li>
            <li class="active">Tables</li>
          </ol>
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
              <div class="table-responsive">
                <h4 class="margin-bottom-15">Another Table of Existing Users</h4>
                <table class="table table-striped table-hover table-bordered">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>First Name</th>
                      <th>Last Name</th>
                      <th>Username</th>
                      <th>Email</th>
                      <th>Edit</th>
                      <th>Action</th>
                      <th>Delete</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>John</td>
                      <td>Henry</td>
                      <td>@jh</td>
                      <td>a@company.com</td>
                      <td><a href="#" class="btn btn-default">Edit</a></td>                    
                      <td>
                        <!-- Split button -->
                        <div class="btn-group">
                          <button type="button" class="btn btn-info">Action</button>
                          <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
                            <span class="caret"></span>
                            <span class="sr-only">Toggle Dropdown</span>
                          </button>
                          [[[page:dropdown_menu(["Block/Unblock", "Remove", "Activate"])]]]
                        </div>
                      </td>
                      <td><a href="#" class="btn btn-link">Delete</a></td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>Bill</td>
                      <td>Goods</td>
                      <td>@bg</td>
                      <td>bg@company.com</td>
                      <td><a href="#" class="btn btn-default">Edit</a></td>
                      <td>
                        <div class="btn-group">
                          <button type="button" class="btn btn-info">Action</button>
                          <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
                            <span class="caret"></span>
                            <span class="sr-only">Toggle Dropdown</span>
                          </button>
                          [[[page:dropdown_menu(["Block/Unblock", "Remove", "Activate"])]]]
                        </div>
                      </td>
                      <td><a href="#" class="btn btn-link">Delete</a></td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>Authen</td>
                      <td>Jobs</td>
                      <td>@aj</td>
                      <td>aj@company.com</td>
                      <td><a href="#" class="btn btn-default">Edit</a></td>
                      <td>
                        <!-- Split button -->
                        <div class="btn-group">
                          <button type="button" class="btn btn-info">Action</button>
                          <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
                            <span class="caret"></span>
                            <span class="sr-only">Toggle Dropdown</span>
                          </button>
                          [[[page:dropdown_menu(["Block/Unblock", "Remove", "Activate"])]]]
                        </div>
                      </td>
                      <td><a href="#" class="btn btn-link">Delete</a></td>
                    </tr>
                    <tr>
                      <td>4</td>
                      <td>Jesica</td>
                      <td>High</td>
                      <td>@jh</td>
                      <td>jh@company.com</td>
                      <td><a href="#" class="btn btn-default">Edit</a></td>
                      <td>
                        <!-- Split button -->
                        <div class="btn-group">
                          <button type="button" class="btn btn-info">Action</button>
                          <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
                            <span class="caret"></span>
                            <span class="sr-only">Toggle Dropdown</span>
                          </button>
                          [[[page:dropdown_menu(["Block/Unblock", "Remove", "Activate"])]]]
                        </div>
                      </td>
                      <td><a href="#" class="btn btn-link">Delete</a></td>
                    </tr>
                    <tr>
                      <td>5</td>
                      <td>Tom</td>
                      <td>Grace</td>
                      <td>@tg</td>
                      <td>tg@company.com</td>
                      <td><a href="#" class="btn btn-default">Edit</a></td>
                      <td>
                        <!-- Split button -->
                        <div class="btn-group">
                          <button type="button" class="btn btn-info">Action</button>
                          <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
                            <span class="caret"></span>
                            <span class="sr-only">Toggle Dropdown</span>
                          </button>
                          [[[page:dropdown_menu(["Block/Unblock", "Remove", "Activate"])]]]
                        </div>
                      </td>
                      <td><a href="#" class="btn btn-link">Delete</a></td>
                    </tr>
                    <tr>
                      <td>6</td>
                      <td>Book</td>
                      <td>Rocker</td>
                      <td>@br</td>
                      <td>br@company.com</td>
                      <td><a href="#" class="btn btn-default">Edit</a></td>
                      <td>
                        <!-- Split button -->
                        <div class="btn-group">
                          <button type="button" class="btn btn-info">Action</button>
                          <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
                            <span class="caret"></span>
                            <span class="sr-only">Toggle Dropdown</span>
                          </button>
                          [[[page:dropdown_menu(["Block/Unblock", "Remove", "Activate"])]]]
                        </div>
                      </td>
                      <td><a href="#" class="btn btn-link">Delete</a></td>
                    </tr>                    
                  </tbody>
                </table>
              </div>
              [[[page:pagination_block()]]]
              </ul>  
            </div>
          </div>
        </div>
      </div>