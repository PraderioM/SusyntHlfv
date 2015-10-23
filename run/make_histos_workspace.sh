
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
