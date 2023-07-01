const std = @import("std");

pub const Vec3 = struct {
    x: f32,
    y: f32,
    z: f32,

    pub fn new(x: f32, y: f32, z: f32) Vec3 {
        return .{
            .x = x,
            .y = y,
            .z = z,
        };
    }

    pub fn length_squared(self: Vec3) f32 {
        return self.x * self.x + self.y * self.y + self.z * self.z;
    }

    pub fn length(self: Vec3) f32 {
        return std.math.sqrt(self.length_squared());
    }

    pub fn normalize(self: Vec3) Vec3 {
        const len = self.length();
        return self.fdiv(len);
    }

    pub fn add(self: Vec3, rhs: Vec3) Vec3 {
        return .{
            .x = self.x + rhs.x,
            .y = self.y + rhs.y,
            .z = self.z + rhs.z,
        };
    }

    pub fn sub(self: Vec3, rhs: Vec3) Vec3 {
        return .{
            .x = self.x - rhs.x,
            .y = self.y - rhs.y,
            .z = self.z - rhs.z,
        };
    }

    pub fn mul(self: Vec3, rhs: Vec3) Vec3 {
        return .{
            .x = self.x * rhs.x,
            .y = self.y * rhs.y,
            .z = self.z * rhs.z,
        };
    }

    pub fn div(self: Vec3, rhs: Vec3) Vec3 {
        return .{
            .x = self.x / rhs.x,
            .y = self.y / rhs.y,
            .z = self.z / rhs.z,
        };
    }

    pub fn fadd(self: Vec3, rhs: f32) Vec3 {
        return .{
            .x = self.x + rhs,
            .y = self.y + rhs,
            .z = self.z + rhs,
        };
    }

    pub fn fsub(self: Vec3, rhs: f32) Vec3 {
        return .{
            .x = self.x - rhs,
            .y = self.y - rhs,
            .z = self.z - rhs,
        };
    }

    pub fn fmul(self: Vec3, rhs: f32) Vec3 {
        return .{
            .x = self.x * rhs,
            .y = self.y * rhs,
            .z = self.z * rhs,
        };
    }

    pub fn fdiv(self: Vec3, rhs: f32) Vec3 {
        return .{
            .x = self.x / rhs,
            .y = self.y / rhs,
            .z = self.z / rhs,
        };
    }
};
