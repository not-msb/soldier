const std = @import("std");

pub const Image = struct {
    width: usize,
    height: usize,
    pixels: []u8,

    pub fn write(self: Image, filename: []const u8) !void {
        const file = try std.fs.cwd().createFile(filename, .{});
        defer file.close();

        try std.fmt.format(file.writer(), "P6 {d} {d} 255\n", .{ self.width, self.height });
        try file.writeAll(self.pixels);
    }
};
