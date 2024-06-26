From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 26 Jun 2024 00:23:00 -0700
Subject: [PATCH v3 0/3] Assorted fixes in RISC-V PMU driver
Message-ID: <20240626-misc_perf_fixes-v3-0-de3f8ed88dab@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series contains 3 fixes out of which the first one is a new fix
for invalid event data reported in lkml[2]. The last two are v3 of Samuel's
patch[1]. I added the RB/TB/Fixes tag and moved 1 unrelated change
to its own patch. I also changed a error message in kvm vcpu_pmu from
pr_err to pr_debug to avoid redundant failure error messages generated
due to the boot time quering of events implemented in the patch[1]

Here is the original cover letter for the patch[1]

Before this patch:
$ perf list hw

List of pre-defined events (to be used in -e or -M):

  branch-instructions OR branches                    [Hardware event]
  branch-misses                                      [Hardware event]
  bus-cycles                                         [Hardware event]
  cache-misses                                       [Hardware event]
  cache-references                                   [Hardware event]
  cpu-cycles OR cycles                               [Hardware event]
  instructions                                       [Hardware event]
  ref-cycles                                         [Hardware event]
  stalled-cycles-backend OR idle-cycles-backend      [Hardware event]
  stalled-cycles-frontend OR idle-cycles-frontend    [Hardware event]

$ perf stat -ddd true

 Performance counter stats for 'true':

              4.36 msec task-clock                       #    0.744 CPUs utilized
                 1      context-switches                 #  229.325 /sec
                 0      cpu-migrations                   #    0.000 /sec
                38      page-faults                      #    8.714 K/sec
         4,375,694      cycles                           #    1.003 GHz                         (60.64%)
           728,945      instructions                     #    0.17  insn per cycle
            79,199      branches                         #   18.162 M/sec
            17,709      branch-misses                    #   22.36% of all branches
           181,734      L1-dcache-loads                  #   41.676 M/sec
             5,547      L1-dcache-load-misses            #    3.05% of all L1-dcache accesses
     <not counted>      LLC-loads                                                               (0.00%)
     <not counted>      LLC-load-misses                                                         (0.00%)
     <not counted>      L1-icache-loads                                                         (0.00%)
     <not counted>      L1-icache-load-misses                                                   (0.00%)
     <not counted>      dTLB-loads                                                              (0.00%)
     <not counted>      dTLB-load-misses                                                        (0.00%)
     <not counted>      iTLB-loads                                                              (0.00%)
     <not counted>      iTLB-load-misses                                                        (0.00%)
     <not counted>      L1-dcache-prefetches                                                    (0.00%)
     <not counted>      L1-dcache-prefetch-misses                                               (0.00%)

       0.005860375 seconds time elapsed

       0.000000000 seconds user
       0.010383000 seconds sys

After this patch:
$ perf list hw

List of pre-defined events (to be used in -e or -M):

  branch-instructions OR branches                    [Hardware event]
  branch-misses                                      [Hardware event]
  cache-misses                                       [Hardware event]
  cache-references                                   [Hardware event]
  cpu-cycles OR cycles                               [Hardware event]
  instructions                                       [Hardware event]

$ perf stat -ddd true

 Performance counter stats for 'true':

              5.16 msec task-clock                       #    0.848 CPUs utilized
                 1      context-switches                 #  193.817 /sec
                 0      cpu-migrations                   #    0.000 /sec
                37      page-faults                      #    7.171 K/sec
         5,183,625      cycles                           #    1.005 GHz
           961,696      instructions                     #    0.19  insn per cycle
            85,853      branches                         #   16.640 M/sec
            20,462      branch-misses                    #   23.83% of all branches
           243,545      L1-dcache-loads                  #   47.203 M/sec
             5,974      L1-dcache-load-misses            #    2.45% of all L1-dcache accesses
   <not supported>      LLC-loads
   <not supported>      LLC-load-misses
   <not supported>      L1-icache-loads
   <not supported>      L1-icache-load-misses
   <not supported>      dTLB-loads
            19,619      dTLB-load-misses
   <not supported>      iTLB-loads
             6,831      iTLB-load-misses
   <not supported>      L1-dcache-prefetches
   <not supported>      L1-dcache-prefetch-misses

       0.006085625 seconds time elapsed

       0.000000000 seconds user
       0.013022000 seconds sys

Changes in v3:
 - Added one more fix
 - Separated an unrelated change to its own patch.
 - Rebase and Added RB/TB/Fixes tag.
 - Changed a error message in kvm code to avoid unnecessary failures
   at guest booting.
Changes in v2:
 - Move the event checking to a workqueue to make it asynchronous
 - Add more details to the commit message based on the v1 discussion

[1] https://lore.kernel.org/linux-riscv/20240418014652.1143466-1-samuel.holland at sifive.com/
[2] https://lore.kernel.org/all/CC51D53B-846C-4D81-86FC-FBF969D0A0D6 at pku.edu.cn/

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Atish Patra (1):
      drivers/perf: riscv: Do not update the event data if uptodate

Samuel Holland (2):
      drivers/perf: riscv: Reset the counter to hpmevent mapping while starting cpus
      perf: RISC-V: Check standard event availability

 arch/riscv/kvm/vcpu_pmu.c    |  2 +-
 drivers/perf/riscv_pmu.c     |  2 +-
 drivers/perf/riscv_pmu_sbi.c | 44 +++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 43 insertions(+), 5 deletions(-)
---
base-commit: 55027e689933ba2e64f3d245fb1ff185b3e7fc81
change-id: 20240625-misc_perf_fixes-5c57f555d828
--
Regards,
Atish patra


