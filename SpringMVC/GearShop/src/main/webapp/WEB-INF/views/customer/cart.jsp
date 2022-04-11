<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>GEARSHOP</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="/css/mystyle.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  </head>
  <body class="bg-milk">
    <!-- Banner -->
    <div class="gearshop-top-banner" style="background-image: url(/images/banner.png)"></div>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-sm navbar-light bg-milk nav-border">
      <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="index.html"><img src="/images/logo.png" alt="" style="width: 50px; height: 50px" /></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4" style="margin: 0">
            <li class="nav-item"><a class="nav-link active fontbold" aria-current="page" href="#!">Contact</a></li>
            <li class="nav-item"><a class="nav-link fontbold" href="#!">Youtube</a></li>
            <li class="nav-item" style="margin-left: 100px">
              <form action="" class="form-input">
                <input class="ps-3" type="text" placeholder="Here to search..." />
                <button type="submit"><img src="/images/icon/search.png" alt="" /></button>
              </form>
            </li>
          </ul>
          <form class="d-flex">
            <button class="btn btn-outline-dark" type="submit" style="border-radius: 1.5rem">
              Cart
              <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
            </button>
          </form>
        </div>
      </div>
    </nav>
    <!-- Body -->
    <div class="container mt-3" style="min-height: 720px">
      <div style="text-align: center">
        <h1>Your Cart</h1>
      </div>
      <hr />
      <div class="row py-3">
        <form action="">
          <div style=" border: 3px solid red; border-radius: 10px; ">
            <table style="width: 100%">
                <thead>
                  <tr>
                    <th>Image</th>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Remove</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><img class="cartimg" src="/images/carousel/slideshow_1.webp" alt="" /></td>
                    <td>Acer</td>
                    <td><input class="cart-quantity" type="number" value="1" min="1"></td>
                    <td>2000</td>
                    <td>
                      <a href=""><i class="fa fa-trash" style="color: black"></i></a>
                    </td>
                  </tr>
                  <tr>
                    <td>s</td>
                    <td>s</td>
                    <td>ds</td>
                    <td>ds</td>
                    <td>
                      <a href=""><i class="fa fa-trash" style="color: black"></i></a>
                    </td>
                  </tr>
                  <tr>
                    <td colspan="4" style="font-weight: 900">Total:</td>
                    <td style="font-weight: 900">2500</td>
                  </tr>
                </tbody>
              </table>
          </div>
          <div class="py-5 center">
            <button type="submit" class="btn btn-danger">Checkout</button>
          </div>
        </form>
      </div>
    </div>

    <!----------------------------------- End product home ----------------------------------->

    <!-- Footer-->
    <footer class="py-5 bg-milk">
      <div class="container"><p class="m-0 text-center text-black">Copyright &copy; Your Website 2021</p></div>
    </footer>
  </body>
</html>
