# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier=1 \
    audio_hal.force_voice_config=wide \
    ro.config.media_vol_steps=25

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    persist.bluetooth.disableabsvol=true

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwc.winupdate=0 \
    ro.bq.gpu_to_cpu_unsupported=1 \
    ro.surface_flinger.running_without_sync_framework = true \
    ro.surface_flinger.max_frame_buffer_acquired_buffers = 3 \
    debug.sf.disable_backpressure=1 \
    debug.sf.latch_unsignaled=1 \
    ro.opengles.version=196608

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true \
    debug.stagefright.ccodec=0 \
    debug.stagefright.omx_default_rank=0 \
    debug.stagefright.omx_default_rank.sw-audio=1

# Network
# Define default initial receive window size in segments.
PRODUCT_PROPERTY_OVERRIDES += \
    net.tcp.default_init_rwnd=60

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hdcp2.rx=tz

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.direct.interface=p2p0
