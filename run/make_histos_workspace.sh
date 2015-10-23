
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/May_10/ \
#  --input-fake out/matrix_prediction/May_14/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets,\
# sr_emu_ss,sr_mue_ss,\
# sr_emu_ss_jets,sr_mue_ss_jets,\
# cr_emu_os,cr_mue_os,\
# vr_emu_os,vr_mue_os\
#  --output-dir out/plot_emu/Jun_06/blinded \
#  --log-dir log/plot_emu/Jun_06/blinded \
#  --syst fake\
#  --batch --verbose

# ./python/plot_emu.py \
#  --input-other out/selection_tuple/May_10/ \
#  --input-fake out/matrix_prediction/May_14/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets,\
# sr_emu_ss,sr_mue_ss,\
# sr_emu_ss_jets,sr_mue_ss_jets,\
# cr_emu_os,cr_mue_os,\
# vr_emu_os,vr_mue_os\
#  --unblind\
#  --output-dir out/plot_emu/Jun_06/unblinded \
#  --log-dir log/plot_emu/Jun_06/unblinded \
#  --syst fake\
#  --batch --verbose


######################################################
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/May_10/ \
#  --input-fake out/matrix_prediction/May_14/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jun_06/unblinded \
#  --log-dir log/plot_emu/Jun_06/unblinded \
#  --syst NOM \
#  --batch --verbose

# ./python/plot_emu.py \
#  --input-other out/selection_tuple/May_10/ \
#  --input-fake out/matrix_prediction/May_14/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jun_06/unblinded \
#  --log-dir log/plot_emu/Jun_06/unblinded \
#  --syst fake \
#  --group fake \
#  --batch --verbose

# signal is using the Jun_05 nutples that contain the mc syst

# Jun_14 : pt0>35 in sr_*_os
# Jun_16 1GeV binning

# # general blinded (only need fake syst)
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/May_14/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --output-dir out/plot_emu/Jun_16/blinded \
#  --log-dir log/plot_emu/Jun_16/blinded \
#  --syst fake\
#  --batch --verbose

# # general
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/May_14/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jun_16/unblinded \
#  --log-dir log/plot_emu/Jun_16/unblinded \
#  --syst NOM\
#  --queue  atlas_slow \
#  --batch --verbose

# #fake
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/May_14/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jun_16/unblinded \
#  --log-dir log/plot_emu/Jun_16/unblinded \
#  --group fake\
#  --syst fake\
#  --queue  atlas_slow \
#  --batch --verbose

# # signal (obj syst)
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/May_14/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jun_16/unblinded \
#  --log-dir log/plot_emu/Jun_16/unblinded \
#  --syst object\
#  --disable-cache \
#  --group signaltaue \
#  --batch --verbose

# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/May_14/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jun_16/unblinded \
#  --log-dir log/plot_emu/Jun_16/unblinded \
#  --syst object\
#  --disable-cache \
#  --group signaltaumu \
#  --batch --verbose

# # signal (weight syst)
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/May_14/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jun_16/unblinded \
#  --log-dir log/plot_emu/Jun_16/unblinded \
#  --syst weight\
#  --group signaltaue \
#  --batch --verbose


# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/May_14/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jun_16/unblinded \
#  --log-dir log/plot_emu/Jun_16/unblinded \
#  --syst weight\
#  --group signaltaumu \
#  --batch --verbose


# #fake with frac syst breakdown
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17 \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jun_17/unblinded \
#  --log-dir log/plot_emu/Jun_17/unblinded \
#  --group fake\
#  --syst fake\
#  --batch --verbose


# # general
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jun_23/unblinded \
#  --log-dir log/plot_emu/Jun_23/unblinded \
#  --syst NOM\
#  --queue  atlas_slow \
#  --batch --verbose

# #fake
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jun_23/unblinded \
#  --log-dir log/plot_emu/Jun_23/unblinded \
#  --group fake\
#  --syst fake\
#  --queue  atlas_slow \
#  --batch --verbose

# # signal (obj syst)
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jun_23/unblinded \
#  --log-dir log/plot_emu/Jun_23/unblinded \
#  --syst object\
#  --disable-cache \
#  --group signaltaue \
#  --batch --verbose

# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jun_23/unblinded \
#  --log-dir log/plot_emu/Jun_23/unblinded \
#  --syst object\
#  --disable-cache \
#  --group signaltaumu \
#  --batch --verbose

# # signal (weight syst)
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jun_23/unblinded \
#  --log-dir log/plot_emu/Jun_23/unblinded \
#  --syst weight\
#  --group signaltaue \
#  --batch --verbose


# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jun_23/unblinded \
#  --log-dir log/plot_emu/Jun_23/unblinded \
#  --syst weight\
#  --group signaltaumu \
#  --batch --verbose


# #fake with frac syst breakdown
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17 \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jun_23/unblinded \
#  --log-dir log/plot_emu/Jun_23/unblinded \
#  --group fake\
#  --syst fake\
#  --batch --verbose


## test with relaxed angular cuts Jun_30
## bugfix n_cl_jets Jul_06

# # general
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jul_06/unblinded \
#  --log-dir log/plot_emu/Jul_06/unblinded \
#  --syst NOM\
#  --batch --verbose

#  --queue  atlas_slow \

# # blinded data
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --output-dir out/plot_emu/Jul_06/blinded \
#  --log-dir log/plot_emu/Jul_06/blinded \
#  --group data\
#  --syst NOM\
#  --queue  atlas_slow \
#  --batch --verbose

# #fake
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jul_06/unblinded \
#  --log-dir log/plot_emu/Jul_06/unblinded \
#  --group fake\
#  --syst fake\
#  --queue  atlas_slow \
#  --batch --verbose

# # signal (obj syst)
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jul_06/unblinded \
#  --log-dir log/plot_emu/Jul_06/unblinded \
#  --syst object\
#  --disable-cache \
#  --group signaltaue \
#  --batch --verbose

# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jul_06/unblinded \
#  --log-dir log/plot_emu/Jul_06/unblinded \
#  --syst object\
#  --disable-cache \
#  --group signaltaumu \
#  --batch --verbose

# # signal (weight syst)
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jul_06/unblinded \
#  --log-dir log/plot_emu/Jul_06/unblinded \
#  --syst weight\
#  --group signaltaue \
#  --batch --verbose


# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jul_06/unblinded \
#  --log-dir log/plot_emu/Jul_06/unblinded \
#  --syst weight\
#  --group signaltaumu \
#  --batch --verbose


# # plot control region (unblinded)
# # general
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# cr_emu_os,cr_mue_os\
#  --unblind\
#  --output-dir out/plot_emu/Jul_06/unblinded \
#  --log-dir log/plot_emu/Jul_06/unblinded \
#  --syst NOM\
#  --batch --verbose

# #fake
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# cr_emu_os,cr_mue_os\
#  --unblind\
#  --output-dir out/plot_emu/Jul_06/unblinded \
#  --log-dir log/plot_emu/Jul_06/unblinded \
#  --group fake\
#  --syst fake\
#  --batch --verbose


# # # signal (test pileup syst)
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jul_06/unblinded \
#  --log-dir log/plot_emu/Jul_06/unblinded \
#  --syst PU_UP,PU_DOWN \
#  --group signaltaue \
#  --batch --verbose

# # # signal (test pileup syst)
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# sr_emu_os,sr_mue_os,\
# sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jul_06/unblinded \
#  --log-dir log/plot_emu/Jul_06/unblinded \
#  --syst PU_UP,PU_DOWN \
#  --group signaltaumu \
#  --batch --verbose

# # # plot control region base (unblinded)
# # general
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# cr_base_emu_os,cr_base_mue_os\
#  --unblind\
#  --output-dir out/plot_emu/Jul_06/unblinded \
#  --log-dir log/plot_emu/Jul_06/unblinded \
#  --syst NOM\
#  --batch --verbose

# # fakes
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# cr_base_emu_os,cr_base_mue_os\
#  --unblind\
#  --output-dir out/plot_emu/Jul_06/unblinded \
#  --log-dir log/plot_emu/Jul_06/unblinded \
#  --group fake\
#  --syst fake\
#  --batch --verbose

# # # signal
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# cr_base_emu_os,cr_base_mue_os\
#  --unblind\
#  --output-dir out/plot_emu/Jul_06/unblinded \
#  --log-dir log/plot_emu/Jul_06/unblinded \
#  --syst object\
#  --group signaltaue \
#  --batch --verbose

# # # signal
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# cr_base_emu_os,cr_base_mue_os\
#  --unblind\
#  --output-dir out/plot_emu/Jul_06/unblinded \
#  --log-dir log/plot_emu/Jul_06/unblinded \
#  --syst weight\
#  --group signaltaue \
#  --batch --verbose

# # # signal
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# cr_base_emu_os,cr_base_mue_os\
#  --unblind\
#  --output-dir out/plot_emu/Jul_06/unblinded \
#  --log-dir log/plot_emu/Jul_06/unblinded \
#  --syst object\
#  --group signaltaumu \
#  --batch --verbose

# # # signal
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# cr_base_emu_os,cr_base_mue_os\
#  --unblind\
#  --output-dir out/plot_emu/Jul_06/unblinded \
#  --log-dir log/plot_emu/Jul_06/unblinded \
#  --syst weight\
#  --group signaltaumu \
#  --batch --verbose

# # print m_coll to play with data 
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# sr_emu_os,sr_mue_os,sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jul_24/unblinded \
#  --log-dir log/plot_emu/Jul_24/unblinded \
#  --syst NOM\
#  --group data,signaltaumu,signalatue \
#  --batch --verbose


# broken-down signal
# ./python/plot_emu.py \
#  --input-other out/selection_tuple/Jun_05/ \
#  --input-fake out/matrix_prediction/Jun_17/ \
#  --regions \
# sr_emu_os,sr_mue_os,sr_emu_os_jets,sr_mue_os_jets\
#  --unblind\
#  --output-dir out/plot_emu/Jul_31/unblinded \
#  --log-dir log/plot_emu/Jul_31/unblinded \
#  --syst NOM\
#  --group 'signal.*' \
#  --batch --verbose


# broken-down signal, coarser
./python/plot_emu.py \
 --input-other out/selection_tuple/Jun_05/ \
 --input-fake out/matrix_prediction/Jun_17/ \
 --regions \
sr_emu_os,sr_mue_os,sr_emu_os_jets,sr_mue_os_jets\
 --unblind\
 --output-dir out/plot_emu/Aug_01/unblinded \
 --log-dir log/plot_emu/Aug_01/unblinded \
 --syst NOM\
 --batch --verbose

./python/plot_emu.py \
 --input-other out/selection_tuple/Jun_05/ \
 --input-fake out/matrix_prediction/Jun_17/ \
 --regions \
sr_emu_os,sr_mue_os,sr_emu_os_jets,sr_mue_os_jets\
 --unblind\
 --output-dir out/plot_emu/Aug_01/unblinded \
 --log-dir log/plot_emu/Aug_01/unblinded \
 --group fake\
 --syst fake\
 --batch --verbose

./python/plot_emu.py \
 --input-other out/selection_tuple/Jun_05/ \
 --input-fake out/matrix_prediction/Jun_17/ \
 --regions \
sr_emu_os,sr_mue_os,sr_emu_os_jets,sr_mue_os_jets\
 --unblind\
 --output-dir out/plot_emu/Aug_01/unblinded \
 --log-dir log/plot_emu/Aug_01/unblinded \
 --syst weight\
 --group 'signal.*' \
 --batch --verbose

./python/plot_emu.py \
 --input-other out/selection_tuple/Jun_05/ \
 --input-fake out/matrix_prediction/Jun_17/ \
 --regions \
sr_emu_os,sr_mue_os,sr_emu_os_jets,sr_mue_os_jets\
 --unblind\
 --output-dir out/plot_emu/Aug_01/unblinded \
 --log-dir log/plot_emu/Aug_01/unblinded \
 --syst object\
 --group 'signal.*' \
 --batch --verbose
