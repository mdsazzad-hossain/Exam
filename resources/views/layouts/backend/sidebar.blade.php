<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <a href="{{ route('dashboard') }}" class="brand-link" style="background: #333">
        <img src="/backend/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">Admin Panel</span>
    </a>

    <div class="sidebar">
        <div class="user-panel mt-2 pb-1 mb-2 d-flex" style="background: linear-gradient(45deg, #87aa59, transparent);
      border-radius: 18px;">
            <div class="image">
                @if(auth()->user()->avatar != null)
                    <img src="/images/{{ auth()->user()->avatar }}" style="width: 2.5rem !important;height:2.3rem !important; margin-top: 12px !important;" class="img-circle elevation-2" alt="User Image">
                @else
                    <img src="/backend/dist/img/avatar.jpg" style="width: 2.5rem !important;margin-top: 12px !important;" class="img-circle elevation-2" alt="User Image">
                @endif
            </div>
            <div class="info">
                <a href="#" class="d-block" style="text-transform: capitalize;">{{ $data->name }}</a>
                <span class="badge badge-warning">{{ $data->type }}</span>
            </div>
        </div>

        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

                <li class="nav-item">
                    <a href="{{ route('dashboard') }}" class="nav-link">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Dashboard
                        </p>
                    </a>
                </li>
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-sitemap"></i>
                        <p>
                            Category
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview" style="display: none; margin-left:20px;">
                        <li class="nav-item" style="font-size: 15px;">
                            <a href="{{ route('categories') }}" class="nav-link">
                                <i class="fas fa-check-circle nav-icon"></i>
                                <p>Main Category</p>
                            </a>
                        </li>
                        <li class="nav-item" style="font-size: 15px;">
                            <a href="{{ route('child.category') }}" class="nav-link">
                                <i class="fas fa-check-circle nav-icon"></i>
                                <p>Child Category</p>
                            </a>
                        </li>
                        <li class="nav-item" style="font-size: 15px;">
                            <a href="{{ route('sub.child.category') }}" class="nav-link">
                                <i class="fas fa-check-circle nav-icon"></i>
                                <p>Child of Child-category</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="{{ route('brand.brand_list') }}" class="nav-link">
                        <i class="nav-icon fab fa-bimobject"></i>
                        <p>
                            Brands
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('products') }}" class="nav-link">
                        <i class="nav-icon fab fa-product-hunt"></i>
                        <p>
                            Products
                        </p>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="{{ route('attributes') }}" class="nav-link">
                        <i class="nav-icon fas fa-sitemap"></i>
                        <p>
                            Product Attribute
                        </p>
                    </a>
                </li>


            </ul>
        </nav>
    </div>
</aside>
