depth = DEPTH_BATTLE.BOARD;
listVertex = ds_list_create();
listDivideIndex = ds_list_create();
rot = 0;
rotSpeed = 0;
board_number = global.borderCount

function contains(_x, _y, _listVertex = listVertex) { return relativeContains(_x - x, _y - y, _listVertex); }

function relativeContains(_x, _y, _listVertex = listVertex) {
	var size = ds_list_size(_listVertex);
	if(size < 2)
		return false;
		
	var vsin = dsin(rot), vcos = dcos(rot);
	var xx = _x * vcos - _y * vsin, yy = _x * vsin + _y * vcos;
	
	var isAllHor = true, prevTrend = false, prevHasIntersection = false;
	var prev = _listVertex[| size - 1], cur;
	for(var i = size - 2; i >= 0; i--) {
		cur = _listVertex[| i];
		if(prev[1] != cur[1]) {
			isAllHor = false;
			prevTrend = cur[1] < prev[1];
			prevHasIntersection = (yy >= min(prev[1], cur[1]) && yy <= max(prev[1], cur[1]));
			break;
		}
		prev = cur;
	}
	if(isAllHor)
		return false;
	
	var intersections, count = 0;
	prev = _listVertex[| size - 1];
	for(var i = 0; i < size; i++) {
		cur = _listVertex[| i];
		if(prev[1] != cur[1]) {
			var hasIntersection = false;
			var trend = cur[1] > prev[1];
			if(trend != prevTrend || !prevHasIntersection) {
				if(yy >= min(prev[1], cur[1]) && yy <= max(prev[1], cur[1])) {
					hasIntersection = true;
					intersections[count] = prev[0] + (cur[0] - prev[0])
						* (yy - prev[1]) / (cur[1] - prev[1]);
					count++;
				}
			}
			if(trend != prevTrend)
				prevTrend = trend;
			prevHasIntersection = hasIntersection;
		}
		prev = cur;
	}
	if(count == 0)
		return false;

	array_sort(intersections, true);
	
	
	var isInside = false;
	for(var i = 0; i < count; i++) {
		if(intersections[i] > xx)
			return isInside;
		isInside = !isInside;
	}
    return false;
}

function limit(_x, _y) {
	var size = ds_list_size(listVertex);
	if(size == 0)
		return [_x, _y];
	if(size == 1) {
		var vertex = listVertex[| 0];
		return [vertex[0] + x, vertex[1] + y];
	}
	
	_x -= x;
	_y -= y;
	var vsin = dsin(-rot), vcos = dcos(-rot);
	var xx = _x * vcos + _y * vsin, yy = -_x * vsin + _y * vcos;
	
	var nearestPos, nearestDis = -1;
	var prev = listVertex[| size - 1], cur;
	for(var i = 0; i < size; i++) {
		cur = listVertex[| i];
		if((prev[0] - xx) * (prev[0] - cur[0]) + (prev[1] - yy) * (prev[1] - cur[1]) < 0) {
			var dis = point_distance(xx, yy, prev[0], prev[1]);
			if(dis < nearestDis || nearestDis == -1) {
				nearestDis = dis;
				nearestPos = prev;
			}
		} else if((cur[0] - xx) * (cur[0] - prev[0]) + (cur[1] - yy) * (cur[1] - prev[1]) < 0) {
			var dis = point_distance(xx, yy, cur[0], cur[1]);
			if(dis < nearestDis || nearestDis == -1) {
				nearestDis = dis;
				nearestPos = cur;
			}
		} else {
			var k = ((yy - prev[1]) * (cur[0] - prev[0]) - (xx - prev[0]) * (cur[1] - prev[1]))
				/ (sqr(cur[1] - prev[1]) + sqr(cur[0] - prev[0]));
			var dis = abs(k) * point_distance(prev[0], prev[1], cur[0], cur[1]);
			if(dis < nearestDis || nearestDis == -1) {
				nearestDis = dis;
				nearestPos = [xx + k * (cur[1] - prev[1]), yy + k * (prev[0] - cur[0])];
			}
		}
		prev = cur;
	}
	var resultx = nearestPos[0] * vcos - nearestPos[1] * vsin;
	var resulty = nearestPos[0] * vsin + nearestPos[1] * vcos;
	return [resultx + x, resulty + y];
}

function updateDivide() {
	ds_list_clear(listDivideIndex);
	var size = ds_list_size(listVertex);
	if(size < 3)
		return;
	
	listVertexTmp = ds_list_create();
	ds_list_copy(listVertexTmp, listVertex);
	
	var marker = ds_list_create();
	for(var i = 0; i < size; i++)
		ds_list_add(marker, i);
	
	function canDivide(_index) {
		var p1 = listVertexTmp[| iloop(_index - 1, listVertexTmp)], p2 = listVertexTmp[| iloop(_index + 1, listVertexTmp)];
		if(!relativeContains((p1[0] + p2[0]) / 2, (p1[1] + p2[1]) / 2, listVertexTmp))
			return false;
		
		var istart = _index + 2 - ds_list_size(listVertexTmp), iend = _index - 2;
		var a1 = listVertexTmp[| iloop(_index - 1, listVertexTmp)];
		var a2 = listVertexTmp[| iloop(_index + 1, listVertexTmp)];
		var b1, b2;
		function cp(_a1, _a2, _b1, _b2) { return (_a2[0] - _a1[0]) * (_b2[1] - _b1[1]) - (_a2[1] - _a1[1]) * (_b2[0] - _b1[0]); }
		for(var i = istart; i < iend; i++) {
			b1 = listVertexTmp[| iloop(i, listVertexTmp)];
			b2 = listVertexTmp[| iloop(i + 1, listVertexTmp)];
			if(sign(cp(a1, a2, a1, b1)) != sign(cp(a1, a2, a1, b2)) && sign(cp(b1, b2, b1, a1)) != sign(cp(b1, b2, b1, a2)))
				return false;
		}
		return true;
	}
	function isConvex() {
		var bool1 = false, bool2 = false;
		for(var i = 0; i < ds_list_size(listVertexTmp); i++) {
			var p1 = listVertexTmp[| i];
			var p2 = listVertexTmp[| iloop(i + 1, listVertexTmp)];
			var p3 = listVertexTmp[| iloop(i + 2, listVertexTmp)];
			var x1 = p2[0] - p1[0], y1 = p2[1] - p1[1], x2 = p3[0] - p2[0], y2 = p3[1] - p2[1];
			var cp = x1 * y2 - x2 * y1;
			
			if(cp > 0) {
				bool1 = true;
			} else if(cp < 0) {
				bool2 = true;
			}
			
			if(bool1 && bool2)
				return false;
		}
		return true;
	}
	
	while(!isConvex()) {
		var divided = false;
		for(var i = 0; i < ds_list_size(listVertexTmp); i++) {
			if(canDivide(i)) {
				divided = true;
				var a = marker[| iloop(i - 1, marker)];
				var b = marker[| iloop(i + 1, marker)];
				ds_list_add(listDivideIndex, [marker[| i], a, b]);
				ds_list_delete(listVertexTmp, i);
				ds_list_delete(marker, i);
				break;
			}
		}
		if(!divided) {
			ds_list_clear(listDivideIndex);
			ds_list_destroy(listVertexTmp);
			ds_list_destroy(marker);
			return;
		}
	}
	var tmpLast = ds_list_size(listVertexTmp) - 1;
	var last = marker[| tmpLast];
	for(var i = 0; i < tmpLast - 1; i++) {
		ds_list_add(listDivideIndex, [marker[| i], marker[| iloop(i + 1, marker)], last]);
	}
	
	ds_list_destroy(listVertexTmp);
	ds_list_destroy(marker);
}

function replaceSurfaceAlpha(_surf, _xOffset = 0, _yOffset = 0, _fillAlpha = true) {
	surface_set_target(_surf);
	gpu_set_colorwriteenable(false, false, false, true);
	gpu_set_blendenable(false);
	
	if(_fillAlpha) {
		draw_set_alpha(0);
		draw_rectangle(0, 0, surface_get_width(_surf), surface_get_height(_surf),false);
	}
	
	draw_set_alpha(1);
	var vsin = dsin(-rot), vcos = dcos(-rot);
	var size = ds_list_size(listDivideIndex);
	for(var i = 0; i < size; i++) {
		var di = listDivideIndex[| i];
		draw_primitive_begin(pr_trianglelist);
		for(var j = 0; j < 3; j++) {
			var pos = listVertex[| di[j]];
			var resultx = pos[0] * vcos - pos[1] * vsin;
			var resulty = pos[0] * vsin + pos[1] * vcos;
			draw_vertex(x + _xOffset + resultx, y + _yOffset + resulty);
		}
		draw_primitive_end();
	}

	gpu_set_blendenable(true);
	gpu_set_colorwriteenable(true, true, true, true);
	surface_reset_target();
}

function drawBorder() {
	var vsin = dsin(-rot), vcos = dcos(-rot);
	for(var i = 0; i < ds_list_size(listVertex); i++) {
		var a = listVertex[| i], b = listVertex[| iloop(i + 1)];
		var ax = a[0] * vcos - a[1] * vsin;
		var ay = a[0] * vsin + a[1] * vcos;
		var bx = b[0] * vcos - b[1] * vsin;
		var by = b[0] * vsin + b[1] * vcos;
		
		draw_sprite_ext(spr_pixel,0,x + ax - 5*cos(degtorad(floor(point_direction(ax,ay,bx,by)))),y + ay + 5*sin(degtorad(floor(point_direction(ax,ay,bx,by)))),5,point_distance(ax,ay,bx,by)+5+5*cos(degtorad((point_direction(ax,ay,bx,by)%45))),point_direction(ax,ay,bx,by)+90,battle_board.color_frame,battle_board.alpha_frame);
	}
}
function iloop(_index, _list = listVertex) {
	if(_index >= ds_list_size(_list))
		return _index - ds_list_size(_list);
	if(_index < 0)
		return _index + ds_list_size(_list);
	return _index;
}