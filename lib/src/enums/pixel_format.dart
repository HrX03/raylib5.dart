enum PixelFormat {
  uncompressedGrayscale(8), // 8 bit per pixel (no alpha)
  uncompressedGrayAlpha(8 * 2), // 8*2 bpp (2 channels)
  uncompressedR5G6B5(16), // 16 bpp
  uncompressedR8G8B8(24), // 24 bpp
  uncompressedR5G5B5A1(16), // 16 bpp (1 bit alpha)
  uncompressedR4G4B4A4(16), // 16 bpp (4 bit alpha)
  uncompressedR8G8B8A8(32), // 32 bpp
  uncompressedR32(32), // 32 bpp (1 channel - float)
  uncompressedR32G32B32(32 * 3), // 32*3 bpp (3 channels - float)
  uncompressedR32G32B32A32(32 * 4), // 32*4 bpp (4 channels - float)
  uncompressedR16(16), // 16 bpp (1 channel - half float)
  uncompressedR16G16B16(16 * 3), // 16*3 bpp (3 channels - half float)
  uncompressedR16G16B16A16(16 * 4), // 16*4 bpp (4 channels - half float)
  compressedDXT1RGB(4), // 4 bpp (no alpha)
  compressedDXT1RGBA(4), // 4 bpp (1 bit alpha)
  compressedDXT3RGBA(8), // 8 bpp
  compressedDXT5RGBA(8), // 8 bpp
  compressedETC1RGB(4), // 4 bpp
  compressedETC2RGB(4), // 4 bpp
  compressedETC2EACRGBA(8), // 8 bpp
  compressedPVRTRGB(4), // 4 bpp
  compressedPVRTRGBA(4), // 4 bpp
  compressedASTC4x4RGBA(8), // 8 bpp
  compressedASTC8x8RGBA(2); // 2 bpp

  final int bitPerPixel;

  const PixelFormat(this.bitPerPixel);

  int get value => index + 1;
}
