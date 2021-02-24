@foreach ($products as $pro)


<tr role="row" class="odd">
    <td class="sorting_1">{{ $pro->product_name }}</td>
    <td class="sorting_1">{{ $pro->get_brand->brand_name }}</td>
    <td class="sorting_1">{{ $pro->product_code }}</td>
    <td class="sorting_1">{{ $pro->color }}</td>
    <td>
        @if ($pro->status == 0)
            <span onclick="productStatus({{$pro->id}})" style="cursor: pointer;margin: 0px;" class="badge badge-warning">Inactive</span>
        @else
            <span onclick="productStatus({{$pro->id}})" style="cursor: pointer;margin: 0px;" class="badge badge-success">Active</span>
        @endif

        @php
            $id = null;
        @endphp
        @foreach ($pro->get_product_avatars  as $avtr)
            @php
                $id = $avtr->product_id;
            @endphp
            <a href="{{ route('product.avatars', $pro->slug) }}"
                class="badge badge-info">Images</a>
        @endforeach

        @if ($pro->id != $id)
        <span style="cursor: pointer" onclick="addProductAvatar()"
            class="badge badge-danger">Images</span>
        @endif

    </td>

    <td>
        <a href="{{ route('product.edit', $pro->slug) }}" style="margin-right: 5px;"
            class="btn btn-primary btn-xs">
            <i class="fa fa-edit"></i>
        </a>
        {{-- <form action="{{ route('product.delete', $pro->id) }}" method="POST">
            @csrf
            <button class="btn btn-danger btn-sm">
                <i class="fa fa-trash"></i>
            </button>
        </form> --}}
    </td>
</tr>
@endforeach
