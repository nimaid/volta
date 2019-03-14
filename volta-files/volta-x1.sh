#https://github.com/jcjohnson/neural-style

STYLE_IMAGE=$1
CONTENT_IMAGE=$2



verify_file() {
    if [ -f $1 ]; then
       echo "The file '$1' exists. Proceeding..."
    else
       echo "The file '$1' does not exist, likely the previous step failed."
       echo "Exiting..."
       exit 1
    fi
}



STYLE_WEIGHT=1000
STYLE_SCALE=1
CONTENT_WEIGHT=5

th neural_style_dir_rng_fix.lua \
-style_image $STYLE_IMAGE \
-style_weight $STYLE_WEIGHT \
-style_scale $STYLE_SCALE \
-content_image $CONTENT_IMAGE \
-print_iter 1 \
-save_iter 100 \
-image_size 512 \
-num_iterations 1000 \
-model_file models/nyud-fcn32s-color-heavy.caffemodel \
-proto_file models/nyud-fcn32s-color-heavy-trainval.prototxt \
-content_layers relu1_1,relu2_1,relu3_1,relu4_1,relu5_1 \
-style_layers relu1_1,relu2_1,relu3_1,relu4_1,relu5_1 \
-optimizer lbfgs \
-output_image X1.png \
-tv_weight 0.00001 \
-gpu 0 \
-original_colors 0 \
-backend cudnn \
-init random \

verify_file X1.png



STYLE_WEIGHT=100
STYLE_SCALE=1
CONTENT_WEIGHT=375

th neural_style_dir_rng_fix.lua \
-style_image $STYLE_IMAGE \
-style_weight $STYLE_WEIGHT \
-style_scale $STYLE_SCALE \
-content_image $CONTENT_IMAGE \
-init image \
-init_image X1.png \
-print_iter 1 \
-image_size 800 \
-num_iterations 500 \
-model_file models/nyud-fcn32s-color-heavy.caffemodel \
-proto_file models/nyud-fcn32s-color-heavy-trainval.prototxt \
-content_layers relu1_1,relu2_1,relu3_1,relu4_1,relu5_1 \
-style_layers relu1_1,relu2_1,relu3_1,relu4_1,relu5_1 \
-optimizer lbfgs \
-output_image X2.png \
-tv_weight 0.00001 \
-gpu 0 \
-original_colors 0 \
-normalize_gradients \
-backend cudnn

rm X1.png

verify_file X2.png



STYLE_WEIGHT=1000
STYLE_SCALE=1
CONTENT_WEIGHT=0

th neural_style_dir_rng_fix.lua \
-style_image $STYLE_IMAGE \
-style_weight $STYLE_WEIGHT \
-style_scale $STYLE_SCALE \
-content_image $CONTENT_IMAGE \
-content_weight $CONTENT_WEIGHT \
-output_image X3.png \
-num_iterations 200 \
-model_file models/nyud-fcn32s-color-heavy.caffemodel \
-proto_file models/nyud-fcn32s-color-heavy-trainval.prototxt \
-optimizer adam \
-print_iter 1 \
-save_iter 100 \
-tv_weight 0 \
-backend cudnn \
-init image \
-init_image X2.png \
-learning_rate 1 \
-image_size 1148 \
-gpu 0 \
-original_colors 0 \
-normalize_gradients \

rm X2.png

verify_file X3.png



th neural_style_dir_rng_fix.lua \
-style_image $STYLE_IMAGE \
-style_weight $STYLE_WEIGHT \
-style_scale $STYLE_SCALE \
-content_image $CONTENT_IMAGE \
-content_weight $CONTENT_WEIGHT \
-output_image X4.png \
-num_iterations 600 \
-model_file models/channel_pruning.caffemodel \
-proto_file models/channel_pruning.prototxt \
-optimizer adam \
-print_iter 1 \
-save_iter 100 \
-tv_weight 0 \
-backend cudnn \
-init image \
-init_image X3.png \
-learning_rate 1 \
-image_size 1800 \
-gpu 0 \
-original_colors 0 \
-normalize_gradients \

rm X3.png

verify_file X4.png



th neural_style_dir_rng_fix.lua \
-style_image $STYLE_IMAGE \
-style_weight $STYLE_WEIGHT \
-style_scale $STYLE_SCALE \
-content_image $CONTENT_IMAGE \
-content_weight $CONTENT_WEIGHT \
-output_image X5.png \
-model_file models/nin_imagenet_conv.caffemodel \
-proto_file models/train_val.prototxt \
-num_iterations 200 \
-content_layers relu0,relu1,relu2,relu3,relu5,relu6,relu7,relu8 \
-style_layers relu0,relu1,relu2,relu3,relu5,relu6,relu7,relu8 \
-optimizer adam \
-print_iter 1 \
-save_iter 100 \
-tv_weight 0 \
-backend cudnn \
-init image \
-init_image X4.png \
-learning_rate 1 \
-image_size 2550 \
-gpu 0 \
-original_colors 0 \
-normalize_gradients \

rm X4.png

verify_file X5.png



STYLE_WEIGHT=1000
STYLE_SCALE=1
CONTENT_WEIGHT=0

th neural_style_dir_rng_fix.lua \
-style_image $STYLE_IMAGE \
-style_weight $STYLE_WEIGHT \
-style_scale $STYLE_SCALE \
-content_image $CONTENT_IMAGE \
-content_weight $CONTENT_WEIGHT \
-output_image X6.png \
-model_file models/nin_imagenet_conv.caffemodel \
-proto_file models/train_val.prototxt \
-num_iterations 200 \
-content_layers relu0,relu1,relu2,relu3,relu5,relu6 \
-style_layers relu0,relu1,relu2,relu3,relu5,relu6 \
-optimizer adam \
-print_iter 1 \
-save_iter 100 \
-tv_weight 0 \
-backend cudnn \
-init image \
-init_image X5.png \
-learning_rate 1 \
-image_size 2700 \
-gpu 0 \
-original_colors 0 \
-normalize_gradients \

rm X5.png

verify_file X6.png



th neural_style_dir_rng_fix.lua \
-style_image $STYLE_IMAGE \
-style_weight $STYLE_WEIGHT \
-style_scale $STYLE_SCALE \
-content_image $CONTENT_IMAGE \
-content_weight $CONTENT_WEIGHT \
-output_image X7.png \
-model_file models/nin_imagenet_conv.caffemodel \
-proto_file models/train_val.prototxt \
-num_iterations 200 \
-content_layers relu0,relu1,relu2,relu3,relu5,relu6,relu7,relu8 \
-style_layers relu0,relu1,relu2,relu3,relu5,relu6,relu7,relu8 \
-optimizer adam \
-print_iter 1 \
-save_iter 0 \
-tv_weight 0 \
-backend cudnn \
-init image \
-init_image X6.png \
-learning_rate 1 \
-image_size 2900 \
-gpu 0 \
-original_colors 0 \
-normalize_gradients \

rm X6.png

verify_file X7.png



th neural_style_dir_rng_fix.lua \
-style_image $STYLE_IMAGE \
-style_weight $STYLE_WEIGHT \
-style_scale $STYLE_SCALE \
-content_image $CONTENT_IMAGE \
-content_weight $CONTENT_WEIGHT \
-output_image X8.png \
-model_file models/nin_imagenet_conv.caffemodel \
-proto_file models/train_val.prototxt \
-num_iterations 200 \
-content_layers relu0,relu1 \
-style_layers relu0,relu1 \
-optimizer adam \
-print_iter 1 \
-save_iter 0 \
-tv_weight 0 \
-backend cudnn \
-init image \
-init_image X7.png \
-learning_rate 1 \
-image_size 4000 \
-gpu 0 \
-original_colors 0 \
-normalize_gradients \

rm X7.png

verify_file X8.png



STYLE_SCALE=0.5

th neural_style_dir_rng_fix.lua \
-style_image $STYLE_IMAGE \
-content_image $CONTENT_IMAGE \
-output_image X9.png \
-model_file models/nin_imagenet_conv.caffemodel \
-proto_file models/train_val.prototxt \
-num_iterations 20 \
-content_layers relu0,relu1 \
-style_layers relu0,relu1 \
-optimizer adam \
-print_iter 1 \
-save_iter 0 \
-tv_weight 0 \
-style_scale $STYLE_SCALE \
-backend cudnn \
-content_weight $CONTENT_WEIGHT \
-style_weight $STYLE_WEIGHT \
-init image \
-init_image X8.png \
-learning_rate 1 \
-image_size 5600 \
-gpu 0 \
-original_colors 0 \

rm X8.png

verify_file X9.png



# ENTERING PART 2 ##



STYLE_WEIGHT=1000
STYLE_SCALE=0.5
CONTENT_WEIGHT=0

th neural_style_dir_rng_fix.lua \
-style_image $STYLE_IMAGE \
-content_image $CONTENT_IMAGE \
-output_image X9a.png \
-model_file models/nin_imagenet_conv.caffemodel \
-proto_file models/train_val.prototxt \
-num_iterations 20 \
-content_layers relu0,relu1 \
-style_layers relu0,relu1 \
-optimizer adam \
-print_iter 1 \
-save_iter 0 \
-tv_weight 0 \
-style_scale $STYLE_SCALE \
-backend cudnn \
-content_weight $CONTENT_WEIGHT \
-style_weight $STYLE_WEIGHT \
-init image \
-init_image X8.png \
-learning_rate 1 \
-image_size 5500 \
-gpu 0 \
-original_colors 0 \

rm X8.png

verify_file X9a.png



th neural_style_dir_rng_fix.lua \
-style_image $STYLE_IMAGE \
-content_image $CONTENT_IMAGE \
-output_image X9b.png \
-model_file models/nin_imagenet_conv.caffemodel \
-proto_file models/train_val.prototxt \
-num_iterations 20 \
-content_layers relu0,relu1 \
-style_layers relu0,relu1 \
-optimizer adam \
-print_iter 1 \
-save_iter 0 \
-tv_weight 0 \
-style_scale $STYLE_SCALE \
-backend cudnn \
-content_weight $CONTENT_WEIGHT \
-style_weight $STYLE_WEIGHT \
-init image \
-init_image X9a.png \
-learning_rate 1 \
-image_size 5400 \
-gpu 0 \
-original_colors 0 \

rm X9a.png

verify_file X9b.png



th neural_style_dir_rng_fix.lua \
-style_image $STYLE_IMAGE \
-content_image $CONTENT_IMAGE \
-output_image X9c.png \
-model_file models/nin_imagenet_conv.caffemodel \
-proto_file models/train_val.prototxt \
-num_iterations 20 \
-content_layers relu0,relu1 \
-style_layers relu0,relu1 \
-optimizer adam \
-print_iter 1 \
-save_iter 0 \
-tv_weight 0 \
-style_scale $STYLE_SCALE \
-backend cudnn \
-content_weight $CONTENT_WEIGHT \
-style_weight $STYLE_WEIGHT \
-init image \
-init_image X9b.png \
-learning_rate 1 \
-image_size 5300 \
-gpu 0 \
-original_colors 0 \

rm X9b.png

verify_file X9c.png



th neural_style_dir_rng_fix.lua \
-style_image $STYLE_IMAGE \
-content_image $CONTENT_IMAGE \
-output_image X9d.png \
-model_file models/nin_imagenet_conv.caffemodel \
-proto_file models/train_val.prototxt \
-num_iterations 20 \
-content_layers relu0,relu1 \
-style_layers relu0,relu1 \
-optimizer adam \
-print_iter 1 \
-save_iter 0 \
-tv_weight 0 \
-style_scale $STYLE_SCALE \
-backend cudnn \
-content_weight $CONTENT_WEIGHT \
-style_weight $STYLE_WEIGHT \
-init image \
-init_image X9c.png \
-learning_rate 1 \
-image_size 5200 \
-gpu 0 \
-original_colors 0 \

rm X9c.png

verify_file X9d.png



th neural_style_dir_rng_fix.lua \
-style_image $STYLE_IMAGE \
-content_image $CONTENT_IMAGE \
-output_image X9e.png \
-model_file models/nin_imagenet_conv.caffemodel \
-proto_file models/train_val.prototxt \
-num_iterations 20 \
-content_layers relu0,relu1 \
-style_layers relu0,relu1 \
-optimizer adam \
-print_iter 1 \
-save_iter 0 \
-tv_weight 0 \
-style_scale $STYLE_SCALE \
-backend cudnn \
-content_weight $CONTENT_WEIGHT \
-style_weight $STYLE_WEIGHT \
-init image \
-init_image X9d.png \
-learning_rate 1 \
-image_size 5100 \
-gpu 0 \
-original_colors 0 \

rm X9d.png

verify_file X9e.png



th neural_style_dir_rng_fix.lua \
-style_image $STYLE_IMAGE \
-content_image $CONTENT_IMAGE \
-output_image X9f.png \
-model_file models/nin_imagenet_conv.caffemodel \
-proto_file models/train_val.prototxt \
-num_iterations 20 \
-content_layers relu0,relu1 \
-style_layers relu0,relu1 \
-optimizer adam \
-print_iter 1 \
-save_iter 0 \
-tv_weight 0 \
-style_scale $STYLE_SCALE \
-backend cudnn \
-content_weight $CONTENT_WEIGHT \
-style_weight $STYLE_WEIGHT \
-init image \
-init_image X9e.png \
-learning_rate 1 \
-image_size 5000 \
-gpu 0 \
-original_colors 0 \

rm X9e.png

verify_file X9f.png



th neural_style_dir_rng_fix.lua \
-style_image $STYLE_IMAGE \
-content_image $CONTENT_IMAGE \
-output_image X9g.png \
-model_file models/nin_imagenet_conv.caffemodel \
-proto_file models/train_val.prototxt \
-num_iterations 20 \
-content_layers relu0,relu1 \
-style_layers relu0,relu1 \
-optimizer adam \
-print_iter 1 \
-save_iter 0 \
-tv_weight 0 \
-style_scale $STYLE_SCALE \
-backend cudnn \
-content_weight $CONTENT_WEIGHT \
-style_weight $STYLE_WEIGHT \
-init image \
-init_image X9f.png \
-learning_rate 1 \
-image_size 4900 \
-gpu 0 \
-original_colors 0 \

rm X9f.png

verify_file X9g.png



th neural_style_dir_rng_fix.lua \
-style_image $STYLE_IMAGE \
-content_image $CONTENT_IMAGE \
-output_image X9h.png \
-model_file models/nin_imagenet_conv.caffemodel \
-proto_file models/train_val.prototxt \
-num_iterations 20 \
-content_layers relu0,relu1 \
-style_layers relu0,relu1 \
-optimizer adam \
-print_iter 1 \
-save_iter 0 \
-tv_weight 0 \
-style_scale $STYLE_SCALE \
-backend cudnn \
-content_weight $CONTENT_WEIGHT \
-style_weight $STYLE_WEIGHT \
-init image \
-init_image X9g.png \
-learning_rate 1 \
-image_size 4800 \
-gpu 0 \
-original_colors 0 \

rm X9g.png

verify_file X9h.png



th neural_style_dir_rng_fix.lua \
-style_image $STYLE_IMAGE \
-content_image $CONTENT_IMAGE \
-output_image X9i.png \
-model_file models/nin_imagenet_conv.caffemodel \
-proto_file models/train_val.prototxt \
-num_iterations 20 \
-content_layers relu0,relu1 \
-style_layers relu0,relu1 \
-optimizer adam \
-print_iter 1 \
-save_iter 0 \
-tv_weight 0 \
-style_scale $STYLE_SCALE \
-backend cudnn \
-content_weight $CONTENT_WEIGHT \
-style_weight $STYLE_WEIGHT \
-init image \
-init_image X9h.png \
-learning_rate 1 \
-image_size 4700 \
-gpu 0 \
-original_colors 0 \

rm X9h.png

verify_file X9i.png



th neural_style_dir_rng_fix.lua \
-style_image $STYLE_IMAGE \
-content_image $CONTENT_IMAGE \
-output_image X9j.png \
-model_file models/nin_imagenet_conv.caffemodel \
-proto_file models/train_val.prototxt \
-num_iterations 20 \
-content_layers relu0,relu1 \
-style_layers relu0,relu1 \
-optimizer adam \
-print_iter 1 \
-save_iter 0 \
-tv_weight 0 \
-style_scale $STYLE_SCALE \
-backend cudnn \
-content_weight $CONTENT_WEIGHT \
-style_weight $STYLE_WEIGHT \
-init image \
-init_image X9i.png \
-learning_rate 1 \
-image_size 4600 \
-gpu 0 \
-original_colors 0 \

rm X9i.png

verify_file X9j.png



th neural_style_dir_rng_fix.lua \
-style_image $STYLE_IMAGE \
-content_image $CONTENT_IMAGE \
-output_image X9k.png \
-model_file models/nin_imagenet_conv.caffemodel \
-proto_file models/train_val.prototxt \
-num_iterations 20 \
-content_layers relu0,relu1 \
-style_layers relu0,relu1 \
-optimizer adam \
-print_iter 1 \
-save_iter 0 \
-tv_weight 0 \
-style_scale $STYLE_SCALE \
-backend cudnn \
-content_weight $CONTENT_WEIGHT \
-style_weight $STYLE_WEIGHT \
-init image \
-init_image X9j.png \
-learning_rate 1 \
-image_size 4500 \
-gpu 0 \
-original_colors 0 \

rm X9j.png

verify_file X9k.png



th neural_style_dir_rng_fix.lua \
-style_image $STYLE_IMAGE \
-content_image $CONTENT_IMAGE \
-output_image X9l.png \
-model_file models/nin_imagenet_conv.caffemodel \
-proto_file models/train_val.prototxt \
-num_iterations 20 \
-content_layers relu0,relu1 \
-style_layers relu0,relu1 \
-optimizer adam \
-print_iter 1 \
-save_iter 0 \
-tv_weight 0 \
-style_scale $STYLE_SCALE \
-backend cudnn \
-content_weight $CONTENT_WEIGHT \
-style_weight $STYLE_WEIGHT \
-init image \
-init_image X9k.png \
-learning_rate 1 \
-image_size 4400 \
-gpu 0 \
-original_colors 0 \

rm X9k.png

verify_file X9l.png



th neural_style_dir_rng_fix.lua \
-style_image $STYLE_IMAGE \
-content_image $CONTENT_IMAGE \
-output_image final.png \
-model_file models/nin_imagenet_conv.caffemodel \
-proto_file models/train_val.prototxt \
-num_iterations 20 \
-content_layers relu0,relu1 \
-style_layers relu0,relu1 \
-optimizer adam \
-print_iter 1 \
-save_iter 0 \
-tv_weight 0 \
-style_scale $STYLE_SCALE \
-backend cudnn \
-content_weight $CONTENT_WEIGHT \
-style_weight $STYLE_WEIGHT \
-init image \
-init_image X9l.png \
-learning_rate 1 \
-image_size 4300 \
-gpu 0 \
-original_colors 0 \

rm X9l.png

verify_file final.png



echo "All done!"
