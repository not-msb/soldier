const std = @import("std");
const Image = @import("image.zig").Image;
const Vec3 = @import("vec.zig").Vec3;
const Ray = @import("ray.zig").Ray;

pub fn main() !void {
    const width = 1920;
    const height = 1080;
    var pixels: [3 * width * height]u8 = undefined;
    const image: Image = .{
        .width = width,
        .height = height,
        .pixels = &pixels,
    };

    const aspect_ratio = @intToFloat(f32, width) / @intToFloat(f32, height);
    const viewport_height = 2.0;
    const viewport_width = aspect_ratio * viewport_height;
    const focal_length = 1.0;

    const origin = Vec3.new(0.0, 0.0, 0.0);
    const horizontal = Vec3.new(viewport_width, 0.0, 0.0);
    const vertical = Vec3.new(0.0, viewport_height, 0.0);
    const lower_left_corner =
        origin.sub(horizontal.fdiv(2.0)).sub(vertical.fdiv(2.0)).sub(Vec3.new(0.0, 0.0, focal_length));

    for (0..height) |h| {
        std.debug.print("Remaining: {}\n", .{height - h});
        for (0..width) |w| {
            const v = @intToFloat(f32, height - h) / @intToFloat(f32, height - 1);
            const u = @intToFloat(f32, w) / @intToFloat(f32, width - 1);
            const ray = Ray.new(
                origin,
                lower_left_corner.add(horizontal.fmul(u)).add(vertical.fmul(v)).sub(origin),
            );

            const index = 3 * (w + h * width);
            const color = ray.sdf(Vec3.new(0, 0, -20), 10.0, [3]u8{255, 0, 0});
            image.pixels[index] = color[0];
            image.pixels[index + 1] = color[1];
            image.pixels[index + 2] = color[2];
        }
    }

    try image.write("out.ppm");
}
