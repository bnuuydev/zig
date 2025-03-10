const std = @import("std");
const expect = std.testing.expect;

pub fn main() !void {
    const S1 = struct {
        pub fn doTheTest() !void {
            var a: u128 = 0x1234_5678_9012_3456 << 64;
            var b: u128 = 0x00F0_FF00_F00F_00FF << 64;

            _ = &a;
            _ = &b;

            std.debug.print("{x}\n", .{@extractBits(a,b)});
        }
    };

    try S1.doTheTest();

    const S2 = struct {
        pub fn doTheTest() !void {
            var a: u64 = 0x1234_5678_9012_3456;
            var b: u128 = 0x00F0_FF00_F00F_00FF << 64;

            _ = &a;
            _ = &b;

            std.debug.print("{x}\n", .{@depositBits(a,b)});
        }
    };

    try S2.doTheTest();
}
