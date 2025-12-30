@extends('layouts.app')

@section('content')
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/nestable2/1.6.0/jquery.nestable.min.css">
    <style>
        .dd {
            position: relative;
            display: block;
            margin: 0;
            padding: 0;
            max-width: 600px;
            list-style: none;
            font-size: 13px;
            line-height: 20px;
        }

        .dd-list {
            display: block;
            position: relative;
            margin: 0;
            padding: 0;
            list-style: none;
        }

        .dd-list .dd-list {
            padding-left: 60px;
        }

        .dd-collapsed .dd-list {
            display: none;
        }

        .dd-item,
        .dd-empty,
        .dd-placeholder {
            display: block;
            position: relative;
            margin: 0;
            padding: 0;
            min-height: 20px;
            font-size: 13px;
            line-height: 20px;
        }

        .dd-handle {
            display: block;
            height: 45px;
            margin: 5px 0;
            padding: 12px 10px;
            padding-right: 120px;
            color: #333;
            text-decoration: none;
            font-weight: bold;
            border: 1px solid #ccc;
            background: #fafafa;
            border-radius: 3px;
            box-sizing: border-box;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .dd-handle:hover {
            color: #2ea8e5;
            background: #fff;
        }

        .dd-item>button {
            position: relative;
            cursor: pointer;
            float: left;
            width: 25px;
            height: 20px;
            margin: 12px 0;
            padding: 0;
            text-indent: 100%;
            white-space: nowrap;
            overflow: hidden;
            border: 0;
            background: transparent;
            font-size: 12px;
            line-height: 1;
            text-align: center;
            font-weight: bold;
        }

        .dd-item>button:before {
            display: block;
            position: absolute;
            width: 100%;
            text-align: center;
            text-indent: 0;
        }

        .dd-item>button.dd-expand:before {
            content: '+';
        }

        .dd-item>button.dd-collapse:before {
            content: '-';
        }

        .dd-placeholder,
        .dd-empty {
            margin: 5px 0;
            padding: 0;
            min-height: 30px;
            background: #f2fbff;
            border: 1px dashed #b6bcbf;
            box-sizing: border-box;
            -moz-box-sizing: border-box;
        }

        .dd-empty {
            border: 1px dashed #bbb;
            min-height: 100px;
            background-color: #e5e5e5;
            background-image: -webkit-linear-gradient(45deg, #fff 25%, transparent 25%, transparent 75%, #fff 75%, #fff), -webkit-linear-gradient(45deg, #fff 25%, transparent 25%, transparent 75%, #fff 75%, #fff);
            background-image: -moz-linear-gradient(45deg, #fff 25%, transparent 25%, transparent 75%, #fff 75%, #fff), -moz-linear-gradient(45deg, #fff 25%, transparent 25%, transparent 75%, #fff 75%, #fff);
            background-image: linear-gradient(45deg, #fff 25%, transparent 25%, transparent 75%, #fff 75%, #fff), linear-gradient(45deg, #fff 25%, transparent 25%, transparent 75%, #fff 75%, #fff);
            background-size: 60px 60px;
            background-position: 0 0, 30px 30px;
        }

        .dd-dragel {
            position: absolute;
            pointer-events: none;
            z-index: 9999;
        }

        .dd-dragel>.dd-item .dd-handle {
            margin-top: 0;
        }

        .dd-dragel .dd-handle {
            -webkit-box-shadow: 2px 4px 6px 0 rgba(0, 0, 0, .1);
            box-shadow: 2px 4px 6px 0 rgba(0, 0, 0, .1);
        }

        .dd-nochildren .dd-placeholder {
            display: none;
        }

        .menu-actions {
            position: absolute;
            right: 10px;
            top: 7px;
            z-index: 10;
        }
    </style>

    <div class="section-header">
        <h1>Menu Management</h1>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4>Hierarchy (Drag & Drop)</h4>
                </div>
                <div class="card-body">
                    <div class="dd" id="nestable">
                        <ol class="dd-list">
                            @foreach($menus as $menu)
                                <li class="dd-item" data-id="{{ $menu->id }}">
                                    <div class="dd-handle">
                                        @if($menu->icon) <i class="{{ $menu->icon }} mr-2"></i> @endif
                                        {{ $menu->name }}
                                        <span class="badge badge-secondary ml-2">{{ $menu->type }}</span>
                                    </div>
                                    <div class="menu-actions">
                                        <button class="btn btn-sm btn-warning btn-edit" data-id="{{ $menu->id }}"
                                            data-name="{{ $menu->name }}" data-url="{{ $menu->url }}"
                                            data-icon="{{ $menu->icon }}" data-type="{{ $menu->type }}"><i
                                                class="fas fa-edit"></i></button>
                                        <form action="{{ route('menu-management.destroy', $menu->id) }}" method="POST"
                                            class="d-inline">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-sm btn-danger"
                                                onclick="return confirm('Are you sure?')"><i class="fas fa-trash"></i></button>
                                        </form>
                                    </div>
                                    @if($menu->children->count() > 0)
                                        <ol class="dd-list">
                                            @foreach($menu->children as $child)
                                                <li class="dd-item" data-id="{{ $child->id }}">
                                                    <div class="dd-handle">
                                                        @if($child->icon) <i class="{{ $child->icon }} mr-2"></i> @endif
                                                        {{ $child->name }}
                                                    </div>
                                                    <div class="menu-actions">
                                                        <button class="btn btn-sm btn-warning btn-edit" data-id="{{ $child->id }}"
                                                            data-name="{{ $child->name }}" data-url="{{ $child->url }}"
                                                            data-icon="{{ $child->icon }}" data-type="{{ $child->type }}"><i
                                                                class="fas fa-edit"></i></button>
                                                        <form action="{{ route('menu-management.destroy', $child->id) }}" method="POST"
                                                            class="d-inline">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button type="submit" class="btn btn-sm btn-danger"
                                                                onclick="return confirm('Are you sure?')"><i
                                                                    class="fas fa-trash"></i></button>
                                                        </form>
                                                    </div>
                                                </li>
                                            @endforeach
                                        </ol>
                                    @endif
                                </li>
                            @endforeach
                        </ol>
                    </div>
                    <div class="mt-4">
                        <button class="btn btn-primary" id="save-order">Save Hierarchy</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4 id="form-title">Add New Menu</h4>
                </div>
                <div class="card-body">
                    <form id="menu-form" action="{{ route('menu-management.store') }}" method="POST">
                        @csrf
                        <input type="hidden" name="_method" id="form-method" value="POST">
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" name="name" id="input-name" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>URL</label>
                            <input type="text" name="url" id="input-url" class="form-control">
                            <small class="text-muted">Example: /barang or /order</small>
                        </div>
                        <div class="form-group">
                            <label>Icon (FontAwesome)</label>
                            <input type="text" name="icon" id="input-icon" class="form-control">
                            <small class="text-muted">Example: fas fa-fire</small>
                        </div>
                        <div class="form-group">
                            <label>Type</label>
                            <select name="type" id="input-type" class="form-control" required>
                                <option value="menu">Menu Item</option>
                                <option value="header">Section Header</option>
                            </select>
                        </div>
                        <div class="text-right">
                            <button type="button" class="btn btn-secondary d-none" id="btn-cancel-edit">Cancel</button>
                            <button type="submit" class="btn btn-primary">Save Menu</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection

@push('scripts')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/nestable2/1.6.0/jquery.nestable.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#nestable').nestable({
                maxDepth: 2
            });

            $('#save-order').click(function () {
                let list = $('#nestable').nestable('serialize');

                $.ajax({
                    url: "{{ route('menu-management.reorder') }}",
                    type: "POST",
                    data: {
                        _token: "{{ csrf_token() }}",
                        list: JSON.stringify(list)
                    },
                    success: function (response) {
                        Swal.fire('Success', 'Hierarchy saved successfully', 'success').then(() => {
                            location.reload();
                        });
                    }
                });
            });

            $('.btn-edit').click(function () {
                let id = $(this).data('id');
                let name = $(this).data('name');
                let url = $(this).data('url');
                let icon = $(this).data('icon');
                let type = $(this).data('type');

                $('#form-title').text('Edit Menu: ' + name);
                $('#menu-form').attr('action', "{{ url('menu-management') }}/" + id);
                $('#form-method').val('PUT');
                $('#input-name').val(name);
                $('#input-url').val(url);
                $('#input-icon').val(icon);
                $('#input-type').val(type);
                $('#btn-cancel-edit').removeClass('d-none');
            });

            $('#btn-cancel-edit').click(function () {
                $('#form-title').text('Add New Menu');
                $('#menu-form').attr('action', "{{ route('menu-management.store') }}");
                $('#form-method').val('POST');
                $('#input-name').val('');
                $('#input-url').val('');
                $('#input-icon').val('');
                $('#input-type').val('menu');
                $(this).addClass('d-none');
            });
        });
    </script>
@endpush