<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use Illuminate\Http\Request;

class MenuManagementController extends Controller
{
    public function index()
    {
        $menus = Menu::whereNull('parent_id')->with('children')->orderBy('order')->get();
        return view('menu-management.index', compact('menus'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'type' => 'required|in:menu,header',
        ]);

        Menu::create([
            'name' => $request->name,
            'url' => $request->url,
            'icon' => $request->icon,
            'type' => $request->type,
            'order' => Menu::max('order') + 1,
        ]);

        return back()->with('success', 'Menu created successfully');
    }

    public function update(Request $request, Menu $menuManagement)
    {
        $request->validate([
            'name' => 'required',
            'type' => 'required|in:menu,header',
        ]);

        $menuManagement->update([
            'name' => $request->name,
            'url' => $request->url,
            'icon' => $request->icon,
            'type' => $request->type,
        ]);

        return back()->with('success', 'Menu updated successfully');
    }

    public function destroy(Menu $menuManagement)
    {
        $menuManagement->delete();
        return back()->with('success', 'Menu deleted successfully');
    }

    public function reorder(Request $request)
    {
        $list = json_decode($request->list, true);
        $this->saveList($list);

        return response()->json(['success' => true]);
    }

    private function saveList($list, $parentId = null)
    {
        foreach ($list as $index => $item) {
            $menu = Menu::find($item['id']);
            if ($menu) {
                $menu->update([
                    'parent_id' => $parentId,
                    'order' => $index + 1
                ]);

                if (isset($item['children'])) {
                    $this->saveList($item['children'], $menu->id);
                }
            }
        }
    }
}
