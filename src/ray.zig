const std = @import("std");
const Vec3 = @import("vec.zig").Vec3;

pub const Ray = struct {
    org: Vec3,
    dir: Vec3,

    pub fn new(org: Vec3, dir: Vec3) Ray {
        return .{ .org = org, .dir = dir };
    }

    pub fn sdf(self: Ray, org: Vec3, rad: f32, color: [3]u8) [3]u8 {
        var pos = self.org;

        for (0..100) |_| {
            const dist = org.sub(pos).length() - rad;

            if (dist < std.math.floatMin(f32)) {
                return color;
            }

            pos = pos.add(self.dir.fmul(dist));
        }

        return [3]u8{0, 0, 0};
    }
};
