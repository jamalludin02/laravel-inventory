<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Spatie\Activitylog\Models\Activity;

class ActivityLogController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $query = Activity::latest();
        if (auth()->user()->role_id != 1) {
            $query->where('causer_id', auth()->id());
        }

        $logs = $query->get();

        return view('aktivitas-user.index', [
            'logs' => $logs
        ]);
    }
}
