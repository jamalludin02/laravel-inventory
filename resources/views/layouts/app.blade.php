<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <title>Inventory Gudang</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="{{ asset('assets/modules/bootstrap/css/bootstrap.min.css') }}">
  <link rel="stylesheet" href="{{ asset('assets/modules/fontawesome/css/all.min.css') }}">

  <!-- CSS Libraries -->

  <!-- Template CSS -->

  <link rel="stylesheet" href="{{ asset('assets/css/style.css') }}">
  <link rel="stylesheet" href="{{ asset('assets/css/components.css') }}">

  <script src="https://code.jquery.com/jquery-3.7.0.min.js"
    integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>


  <!-- Select2 -->
  <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />


  <!-- Datatable Jquery -->
  <link rel="stylesheet" href="//cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">

  <link rel="stylesheet" href="https://cdn.datatables.net/datetime/1.4.1/css/dataTables.dateTime.min.css">

  <!-- Start GA -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=UA-94034622-3"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', 'UA-94034622-3');
  </script>


  <!-- /END GA -->
</head>

<body>
  <div id="app">
    <div class="main-wrapper main-wrapper-1">
      <div class="navbar-bg"></div>
      <nav class="navbar navbar-expand-lg main-navbar">
        <form class="form-inline mr-auto">
          <ul class="navbar-nav mr-3">
            <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="fas fa-bars"></i></a></li>
            <li><a href="#" data-toggle="search" class="nav-link nav-link-lg d-sm-none"><i
                  class="fas fa-search"></i></a></li>
          </ul>
        </form>
        <ul class="navbar-nav navbar-right">


          <li class="dropdown"><a href="#" data-toggle="dropdown"
              class="nav-link dropdown-toggle nav-link-lg nav-link-user">
              <img alt="image" src="{{ asset('assets/img/avatar/avatar-1.png') }}" class="rounded-circle mr-1">
              <div class="d-sm-none d-lg-inline-block">Hi, {{ auth()->user()->name }}</div>
            </a>
            <div class="dropdown-menu dropdown-menu-right">
              @if(session('switched_from'))
                <a href="{{ route('data-pengguna.switch-back') }}"
                  class="dropdown-item has-icon text-danger d-flex align-items-center"
                  style="white-space: normal; max-width: 250px;">
                  <i class="fas fa-undo"></i>
                  <p class="mb-0 ml-2">Switch back to Super Admin</p>
                </a>
              @endif
              <a href="/ubah-password" class="dropdown-item has-icon d-flex align-items-center">
                <i class="fa fa-sharp fa-solid fa-lock"></i>
                <p class="mb-0 ml-2">Ubah Password</p>
              </a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item has-icon d-flex align-items-center text-danger" href="{{ route('logout') }}"
                onclick="event.preventDefault();
                            Swal.fire({
                                title: 'Konfirmasi Keluar',
                                text: 'Apakah Anda yakin ingin keluar?',
                                icon: 'warning',
                                showCancelButton: true,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#d33',
                                confirmButtonText: 'Ya, Keluar!'
                              }).then((result) => {
                                if (result.isConfirmed) {
                                  document.getElementById('logout-form').submit();
                                }
                              });">
                <i class="fas fa-sign-out-alt"></i>
                <p class="mb-0 ml-2">{{ __('Keluar') }}</p>
              </a>
              <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                @csrf
              </form>
            </div>
          </li>
        </ul>
      </nav>
      <div class="main-sidebar sidebar-style-2">
        <aside id="sidebar-wrapper">

          <div class="sidebar-brand">
            <a href="/">INVENTORY GUDANG</a>
          </div>

          <ul class="sidebar-menu">
            @php
              $menus = auth()->user()->role->menus()->whereNull('parent_id')->with([
                'children' => function ($q) {
                  $q->whereHas('roles', function ($rq) {
                    $rq->where('role_id', auth()->user()->role_id);
                  })->orderBy('order');
                }
              ])->orderBy('order')->get();
            @endphp

            @foreach($menus as $menu)
              @if($menu->type === 'header')
                <li class="menu-header">{{ $menu->name }}</li>
                @foreach($menu->children as $child)
                  @if($child->children->count() > 0)
                    <li
                      class="dropdown {{ collect($child->children->pluck('url'))->contains(fn($url) => Request::is(ltrim($url, '/')) || Request::is(ltrim($url, '/') . '/*')) ? 'active' : '' }}">
                      <a href="#" class="nav-link has-dropdown" data-toggle="dropdown">
                        @if($child->icon) <i class="{{ $child->icon }}"></i> @endif
                        <span>{{ $child->name }}</span>
                      </a>
                      <ul class="dropdown-menu">
                        @foreach($child->children as $subChild)
                          <li>
                            <a class="nav-link {{ Request::is(ltrim($subChild->url, '/')) || Request::is(ltrim($subChild->url, '/') . '/*') ? 'active' : '' }}"
                              href="{{ $subChild->url }}">
                              <i class="fa fa-solid fa-circle fa-xs"></i> {{ $subChild->name }}
                            </a>
                          </li>
                        @endforeach
                      </ul>
                    </li>
                  @else
                    <li
                      class="{{ Request::is(ltrim($child->url, '/')) || ($child->url !== '/' && Request::is(ltrim($child->url, '/') . '/*')) ? 'active' : '' }}">
                      <a class="nav-link" href="{{ $child->url }}">
                        @if($child->icon) <i class="{{ $child->icon }}"></i> @endif
                        <span>{{ $child->name }}</span>
                      </a>
                    </li>
                  @endif
                @endforeach
              @else
                @if($menu->children->count() > 0)
                  <li
                    class="dropdown {{ collect($menu->children->pluck('url'))->contains(fn($url) => Request::is(ltrim($url, '/')) || Request::is(ltrim($url, '/') . '/*')) ? 'active' : '' }}">
                    <a href="#" class="nav-link has-dropdown" data-toggle="dropdown">
                      @if($menu->icon) <i class="{{ $menu->icon }}"></i> @endif
                      <span>{{ $menu->name }}</span>
                    </a>
                    <ul class="dropdown-menu">
                      @foreach($menu->children as $child)
                        <li>
                          <a class="nav-link {{ Request::is(ltrim($child->url, '/')) || Request::is(ltrim($child->url, '/') . '/*') ? 'active' : '' }}"
                            href="{{ $child->url }}">
                            <i class="fa fa-solid fa-circle fa-xs"></i> {{ $child->name }}
                          </a>
                        </li>
                      @endforeach
                    </ul>
                  </li>
                @else
                  <li
                    class="{{ Request::is(ltrim($menu->url, '/')) || ($menu->url !== '/' && Request::is(ltrim($menu->url, '/') . '/*')) ? 'active' : '' }}">
                    <a class="nav-link" href="{{ $menu->url }}">
                      @if($menu->icon) <i class="{{ $menu->icon }}"></i> @endif
                      <span>{{ $menu->name }}</span>
                    </a>
                  </li>
                @endif
              @endif
            @endforeach
          </ul>

        </aside>
      </div>

      <!-- Main Content -->
      <div class="main-content">
        <section class="section">

          @yield('content')
          <div class="section-body">
          </div>
        </section>
      </div>
      <footer class="main-footer">
        <div class="footer-left">
          Copyright &copy; 2025
        </div>
        <div class="footer-right">

        </div>
      </footer>
    </div>
  </div>



  <!-- General JS Scripts -->
  <script src="{{ asset('assets/modules/jquery.min.js') }}"></script>
  <script src="{{ asset('assets/modules/popper.js') }}"></script>
  <script src="{{ asset('assets/modules/tooltip.js') }}"></script>
  <script src="{{ asset('assets/modules/bootstrap/js/bootstrap.min.js') }}"></script>
  <script src="{{ asset('assets/modules/nicescroll/jquery.nicescroll.min.js') }}"></script>
  <script src="{{ asset('assets/modules/moment.min.js') }}"></script>
  <script src="{{ asset('assets/js/stisla.js') }}"></script>

  <!-- JS Libraies -->

  <!-- Select2 Jquery -->
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"
    integrity="sha256-lSjKY0/srUM9BE3dPm+c4fBo1dky2v27Gdjm2uoZaL0=" crossorigin="anonymous"></script>

  <!-- Page Specific JS File -->

  <!-- Template JS File -->
  <script src="{{ asset('assets/js/scripts.js') }}"></script>
  <script src="{{ asset('assets/js/custom.js') }}"></script>

  <!-- Datatables Jquery -->
  <script type="text/javascript" src="//cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

  <!-- Sweet Alert -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  @include('sweetalert::alert')

  <!-- Day Js Format -->
  <script src="https://cdn.jsdelivr.net/npm/dayjs@1/dayjs.min.js"></script>


  @stack('scripts')


  <script>
    $(document).ready(function () {
      var currentPath = window.location.pathname;

      $('.nav-link a[href="' + currentPath + '"]').addClass('active');
    });
  </script>

</body>

</html>