From: Shuah Khan <skhan@linuxfoundation.org>
Date: Wed, 8 May 2024 17:10:24 -0600
Subject: [PATCH v2 0/5] Define _GNU_SOURCE for sources using
In-Reply-To: <20240507214254.2787305-1-edliaw@google.com>
References: <20240507214254.2787305-1-edliaw@google.com>
Message-ID: <f4e45604-86b0-4be6-9bea-36edf301df33@linuxfoundation.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 5/7/24 15:38, Edward Liaw wrote:
> 809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
> asprintf into kselftest_harness.h, which is a GNU extension and needs
> _GNU_SOURCE to either be defined prior to including headers or with the
> -D_GNU_SOURCE flag passed to the compiler.
> 
> v1: https://lore.kernel.org/linux-kselftest/20240430235057.1351993-1-edliaw at google.com/
> v2: add -D_GNU_SOURCE to KHDR_INCLUDES so that it is in a single
> location.  Remove #define _GNU_SOURCE from source code to resolve
> redefinition warnings.
> 
> Edward Liaw (5):
>    selftests: Compile kselftest headers with -D_GNU_SOURCE
>    selftests/sgx: Include KHDR_INCLUDES in Makefile

I appled patches 1/5 and 2.5 - The rest need to be split up.

>    selftests: Include KHDR_INCLUDES in Makefile
>    selftests: Drop define _GNU_SOURCE
>    selftests: Drop duplicate -D_GNU_SOURCE
> 

Please split these patches pwe test directory. Otherwise it will
cause merge conflicts which can be hard to resolve.

>   tools/testing/selftests/Makefile                              | 4 ++--
>   tools/testing/selftests/alsa/Makefile                         | 2 +-
>   tools/testing/selftests/arm64/signal/Makefile                 | 2 +-
>   tools/testing/selftests/cachestat/test_cachestat.c            | 2 --
>   tools/testing/selftests/capabilities/test_execve.c            | 2 --
>   tools/testing/selftests/clone3/clone3.c                       | 2 --
>   .../testing/selftests/clone3/clone3_cap_checkpoint_restore.c  | 2 --
>   tools/testing/selftests/clone3/clone3_clear_sighand.c         | 2 --
>   tools/testing/selftests/clone3/clone3_selftests.h             | 1 -
>   tools/testing/selftests/clone3/clone3_set_tid.c               | 2 --
>   tools/testing/selftests/core/close_range_test.c               | 2 --
>   tools/testing/selftests/drivers/dma-buf/udmabuf.c             | 1 -
>   tools/testing/selftests/exec/Makefile                         | 2 +-
>   tools/testing/selftests/fchmodat2/fchmodat2_test.c            | 2 --
>   tools/testing/selftests/filesystems/binderfs/binderfs_test.c  | 2 --
>   tools/testing/selftests/filesystems/devpts_pts.c              | 1 -
>   tools/testing/selftests/filesystems/dnotify_test.c            | 1 -
>   tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c | 2 --
>   tools/testing/selftests/filesystems/eventfd/eventfd_test.c    | 2 --
>   tools/testing/selftests/filesystems/fat/rename_exchange.c     | 2 --
>   tools/testing/selftests/filesystems/overlayfs/Makefile        | 2 +-
>   tools/testing/selftests/filesystems/overlayfs/dev_in_maps.c   | 2 --
>   .../testing/selftests/filesystems/statmount/statmount_test.c  | 3 ---
>   tools/testing/selftests/futex/functional/Makefile             | 2 +-
>   tools/testing/selftests/futex/functional/futex_requeue_pi.c   | 3 ---
>   tools/testing/selftests/hid/Makefile                          | 2 +-
>   tools/testing/selftests/iommu/Makefile                        | 2 --
>   tools/testing/selftests/ipc/msgque.c                          | 1 -
>   tools/testing/selftests/kcmp/kcmp_test.c                      | 2 --
>   tools/testing/selftests/kselftest_harness.h                   | 2 +-
>   tools/testing/selftests/kvm/aarch64/arch_timer.c              | 2 --
>   tools/testing/selftests/kvm/aarch64/page_fault_test.c         | 1 -
>   tools/testing/selftests/kvm/aarch64/psci_test.c               | 3 ---
>   tools/testing/selftests/kvm/aarch64/vgic_init.c               | 1 -
>   tools/testing/selftests/kvm/arch_timer.c                      | 3 ---
>   tools/testing/selftests/kvm/demand_paging_test.c              | 3 ---
>   tools/testing/selftests/kvm/dirty_log_test.c                  | 3 ---
>   tools/testing/selftests/kvm/guest_memfd_test.c                | 2 --
>   tools/testing/selftests/kvm/hardware_disable_test.c           | 3 ---
>   tools/testing/selftests/kvm/include/userfaultfd_util.h        | 3 ---
>   tools/testing/selftests/kvm/kvm_binary_stats_test.c           | 2 --
>   tools/testing/selftests/kvm/kvm_create_max_vcpus.c            | 2 --
>   tools/testing/selftests/kvm/kvm_page_table_test.c             | 3 ---
>   tools/testing/selftests/kvm/lib/assert.c                      | 3 ---
>   tools/testing/selftests/kvm/lib/kvm_util.c                    | 2 --
>   tools/testing/selftests/kvm/lib/memstress.c                   | 2 --
>   tools/testing/selftests/kvm/lib/test_util.c                   | 2 --
>   tools/testing/selftests/kvm/lib/userfaultfd_util.c            | 3 ---
>   tools/testing/selftests/kvm/lib/x86_64/sev.c                  | 1 -
>   tools/testing/selftests/kvm/max_guest_memory_test.c           | 2 --
>   .../testing/selftests/kvm/memslot_modification_stress_test.c  | 3 ---
>   tools/testing/selftests/kvm/riscv/arch_timer.c                | 3 ---
>   tools/testing/selftests/kvm/rseq_test.c                       | 1 -
>   tools/testing/selftests/kvm/s390x/cmma_test.c                 | 2 --
>   tools/testing/selftests/kvm/s390x/sync_regs_test.c            | 2 --
>   tools/testing/selftests/kvm/set_memory_region_test.c          | 1 -
>   tools/testing/selftests/kvm/steal_time.c                      | 1 -
>   tools/testing/selftests/kvm/x86_64/amx_test.c                 | 2 --
>   .../selftests/kvm/x86_64/exit_on_emulation_failure_test.c     | 3 ---
>   tools/testing/selftests/kvm/x86_64/hwcr_msr_test.c            | 2 --
>   tools/testing/selftests/kvm/x86_64/hyperv_cpuid.c             | 2 --
>   tools/testing/selftests/kvm/x86_64/hyperv_evmcs.c             | 1 -
>   tools/testing/selftests/kvm/x86_64/hyperv_ipi.c               | 2 --
>   tools/testing/selftests/kvm/x86_64/hyperv_svm_test.c          | 1 -
>   tools/testing/selftests/kvm/x86_64/hyperv_tlb_flush.c         | 2 --
>   tools/testing/selftests/kvm/x86_64/nested_exceptions_test.c   | 2 --
>   tools/testing/selftests/kvm/x86_64/nx_huge_pages_test.c       | 3 ---
>   tools/testing/selftests/kvm/x86_64/platform_info_test.c       | 2 --
>   tools/testing/selftests/kvm/x86_64/pmu_counters_test.c        | 2 --
>   tools/testing/selftests/kvm/x86_64/pmu_event_filter_test.c    | 3 ---
>   .../selftests/kvm/x86_64/private_mem_conversions_test.c       | 1 -
>   tools/testing/selftests/kvm/x86_64/set_boot_cpu_id.c          | 1 -
>   tools/testing/selftests/kvm/x86_64/set_sregs_test.c           | 1 -
>   .../selftests/kvm/x86_64/smaller_maxphyaddr_emulation_test.c  | 3 ---
>   tools/testing/selftests/kvm/x86_64/smm_test.c                 | 1 -
>   tools/testing/selftests/kvm/x86_64/state_test.c               | 1 -
>   tools/testing/selftests/kvm/x86_64/sync_regs_test.c           | 2 --
>   tools/testing/selftests/kvm/x86_64/ucna_injection_test.c      | 2 --
>   tools/testing/selftests/kvm/x86_64/userspace_msr_exit_test.c  | 2 --
>   tools/testing/selftests/kvm/x86_64/vmx_dirty_log_test.c       | 3 ---
>   tools/testing/selftests/kvm/x86_64/vmx_pmu_caps_test.c        | 1 -
>   .../testing/selftests/kvm/x86_64/vmx_preemption_timer_test.c  | 1 -
>   tools/testing/selftests/kvm/x86_64/xapic_ipi_test.c           | 2 --
>   tools/testing/selftests/kvm/x86_64/xapic_state_test.c         | 1 -
>   tools/testing/selftests/kvm/x86_64/xss_msr_test.c             | 2 --
>   tools/testing/selftests/landlock/base_test.c                  | 2 --
>   tools/testing/selftests/landlock/fs_test.c                    | 2 --
>   tools/testing/selftests/landlock/net_test.c                   | 2 --
>   tools/testing/selftests/landlock/ptrace_test.c                | 2 --
>   tools/testing/selftests/lib.mk                                | 2 +-
>   tools/testing/selftests/lsm/common.c                          | 2 --
>   tools/testing/selftests/lsm/lsm_get_self_attr_test.c          | 2 --
>   tools/testing/selftests/lsm/lsm_list_modules_test.c           | 2 --
>   tools/testing/selftests/lsm/lsm_set_self_attr_test.c          | 2 --
>   tools/testing/selftests/membarrier/membarrier_test_impl.h     | 1 -
>   .../selftests/membarrier/membarrier_test_multi_thread.c       | 1 -
>   .../selftests/membarrier/membarrier_test_single_thread.c      | 1 -
>   tools/testing/selftests/memfd/common.c                        | 1 -
>   tools/testing/selftests/memfd/fuse_test.c                     | 2 --
>   tools/testing/selftests/memfd/memfd_test.c                    | 1 -
>   tools/testing/selftests/mm/cow.c                              | 1 -
>   tools/testing/selftests/mm/gup_longterm.c                     | 1 -
>   tools/testing/selftests/mm/hugepage-mmap.c                    | 1 -
>   tools/testing/selftests/mm/hugepage-mremap.c                  | 2 --
>   tools/testing/selftests/mm/hugetlb-madvise.c                  | 2 --
>   tools/testing/selftests/mm/hugetlb-read-hwpoison.c            | 2 --
>   tools/testing/selftests/mm/khugepaged.c                       | 1 -
>   tools/testing/selftests/mm/ksm_functional_tests.c             | 1 -
>   tools/testing/selftests/mm/madv_populate.c                    | 1 -
>   tools/testing/selftests/mm/map_populate.c                     | 2 --
>   tools/testing/selftests/mm/mdwe_test.c                        | 1 -
>   tools/testing/selftests/mm/memfd_secret.c                     | 2 --
>   tools/testing/selftests/mm/mlock2-tests.c                     | 1 -
>   tools/testing/selftests/mm/mrelease_test.c                    | 1 -
>   tools/testing/selftests/mm/mremap_dontunmap.c                 | 1 -
>   tools/testing/selftests/mm/mremap_test.c                      | 2 --
>   tools/testing/selftests/mm/pagemap_ioctl.c                    | 1 -
>   tools/testing/selftests/mm/pkey-helpers.h                     | 1 -
>   tools/testing/selftests/mm/protection_keys.c                  | 1 -
>   tools/testing/selftests/mm/split_huge_page_test.c             | 2 --
>   tools/testing/selftests/mm/thuge-gen.c                        | 2 --
>   tools/testing/selftests/mm/uffd-common.h                      | 1 -
>   tools/testing/selftests/mount_setattr/mount_setattr_test.c    | 1 -
>   .../move_mount_set_group/move_mount_set_group_test.c          | 1 -
>   tools/testing/selftests/nci/Makefile                          | 2 +-
>   tools/testing/selftests/net/af_unix/diag_uid.c                | 2 --
>   tools/testing/selftests/net/af_unix/scm_pidfd.c               | 1 -
>   tools/testing/selftests/net/af_unix/unix_connect.c            | 2 --
>   tools/testing/selftests/net/csum.c                            | 3 ---
>   tools/testing/selftests/net/gro.c                             | 3 ---
>   tools/testing/selftests/net/ip_defrag.c                       | 3 ---
>   tools/testing/selftests/net/ipsec.c                           | 3 ---
>   tools/testing/selftests/net/ipv6_flowlabel.c                  | 3 ---
>   tools/testing/selftests/net/ipv6_flowlabel_mgr.c              | 3 ---
>   tools/testing/selftests/net/mptcp/mptcp_connect.c             | 3 ---
>   tools/testing/selftests/net/mptcp/mptcp_inq.c                 | 3 ---
>   tools/testing/selftests/net/mptcp/mptcp_sockopt.c             | 3 ---
>   tools/testing/selftests/net/msg_zerocopy.c                    | 3 ---
>   tools/testing/selftests/net/nettest.c                         | 2 --
>   tools/testing/selftests/net/psock_fanout.c                    | 3 ---
>   tools/testing/selftests/net/psock_snd.c                       | 3 ---
>   tools/testing/selftests/net/reuseport_addr_any.c              | 3 ---
>   tools/testing/selftests/net/reuseport_bpf_cpu.c               | 3 ---
>   tools/testing/selftests/net/reuseport_bpf_numa.c              | 3 ---
>   tools/testing/selftests/net/reuseport_dualstack.c             | 3 ---
>   tools/testing/selftests/net/so_incoming_cpu.c                 | 1 -
>   tools/testing/selftests/net/so_netns_cookie.c                 | 1 -
>   tools/testing/selftests/net/so_txtime.c                       | 3 ---
>   tools/testing/selftests/net/tap.c                             | 3 ---
>   tools/testing/selftests/net/tcp_ao/Makefile                   | 2 +-
>   tools/testing/selftests/net/tcp_fastopen_backup_key.c         | 1 -
>   tools/testing/selftests/net/tcp_inq.c                         | 2 --
>   tools/testing/selftests/net/tcp_mmap.c                        | 1 -
>   tools/testing/selftests/net/tls.c                             | 3 ---
>   tools/testing/selftests/net/toeplitz.c                        | 3 ---
>   tools/testing/selftests/net/tun.c                             | 3 ---
>   tools/testing/selftests/net/txring_overwrite.c                | 3 ---
>   tools/testing/selftests/net/txtimestamp.c                     | 3 ---
>   tools/testing/selftests/net/udpgso.c                          | 3 ---
>   tools/testing/selftests/net/udpgso_bench_rx.c                 | 3 ---
>   tools/testing/selftests/net/udpgso_bench_tx.c                 | 3 ---
>   tools/testing/selftests/perf_events/remove_on_exec.c          | 2 --
>   tools/testing/selftests/perf_events/sigtrap_threads.c         | 2 --
>   tools/testing/selftests/pid_namespace/regression_enomem.c     | 1 -
>   tools/testing/selftests/pidfd/pidfd.h                         | 1 -
>   tools/testing/selftests/pidfd/pidfd_fdinfo_test.c             | 2 --
>   tools/testing/selftests/pidfd/pidfd_getfd_test.c              | 2 --
>   tools/testing/selftests/pidfd/pidfd_open_test.c               | 2 --
>   tools/testing/selftests/pidfd/pidfd_poll_test.c               | 2 --
>   tools/testing/selftests/pidfd/pidfd_setns_test.c              | 2 --
>   tools/testing/selftests/pidfd/pidfd_test.c                    | 2 --
>   tools/testing/selftests/pidfd/pidfd_wait.c                    | 2 --
>   tools/testing/selftests/prctl/Makefile                        | 2 ++
>   tools/testing/selftests/proc/Makefile                         | 2 +-
>   tools/testing/selftests/ptrace/get_set_sud.c                  | 1 -
>   tools/testing/selftests/ptrace/peeksiginfo.c                  | 1 -
>   tools/testing/selftests/resctrl/Makefile                      | 2 +-
>   tools/testing/selftests/riscv/mm/Makefile                     | 2 +-
>   tools/testing/selftests/rseq/basic_percpu_ops_test.c          | 1 -
>   tools/testing/selftests/rseq/basic_test.c                     | 2 --
>   tools/testing/selftests/rseq/param_test.c                     | 1 -
>   tools/testing/selftests/rseq/rseq.c                           | 2 --
>   tools/testing/selftests/rtc/Makefile                          | 2 +-
>   tools/testing/selftests/seccomp/seccomp_benchmark.c           | 1 -
>   tools/testing/selftests/seccomp/seccomp_bpf.c                 | 2 --
>   tools/testing/selftests/sgx/Makefile                          | 2 +-
>   tools/testing/selftests/sgx/sigstruct.c                       | 1 -
>   tools/testing/selftests/tmpfs/Makefile                        | 2 +-
>   tools/testing/selftests/user_events/abi_test.c                | 2 --
>   tools/testing/selftests/x86/amx.c                             | 2 --
>   tools/testing/selftests/x86/check_initial_reg_state.c         | 3 ---
>   tools/testing/selftests/x86/corrupt_xstate_header.c           | 3 ---
>   tools/testing/selftests/x86/entry_from_vm86.c                 | 3 ---
>   tools/testing/selftests/x86/fsgsbase.c                        | 2 --
>   tools/testing/selftests/x86/fsgsbase_restore.c                | 2 --
>   tools/testing/selftests/x86/ioperm.c                          | 2 --
>   tools/testing/selftests/x86/iopl.c                            | 2 --
>   tools/testing/selftests/x86/lam.c                             | 1 -
>   tools/testing/selftests/x86/ldt_gdt.c                         | 2 --
>   tools/testing/selftests/x86/mov_ss_trap.c                     | 2 --
>   tools/testing/selftests/x86/nx_stack.c                        | 2 --
>   tools/testing/selftests/x86/ptrace_syscall.c                  | 2 --
>   tools/testing/selftests/x86/sigaltstack.c                     | 2 --
>   tools/testing/selftests/x86/sigreturn.c                       | 3 ---
>   tools/testing/selftests/x86/single_step_syscall.c             | 3 ---
>   tools/testing/selftests/x86/syscall_arg_fault.c               | 3 ---
>   tools/testing/selftests/x86/syscall_numbering.c               | 3 ---
>   tools/testing/selftests/x86/sysret_rip.c                      | 3 ---
>   tools/testing/selftests/x86/sysret_ss_attrs.c                 | 3 ---
>   tools/testing/selftests/x86/test_FCMOV.c                      | 4 ----
>   tools/testing/selftests/x86/test_FCOMI.c                      | 4 ----
>   tools/testing/selftests/x86/test_FISTTP.c                     | 4 ----
>   tools/testing/selftests/x86/test_mremap_vdso.c                | 1 -
>   tools/testing/selftests/x86/test_shadow_stack.c               | 3 ---
>   tools/testing/selftests/x86/test_syscall_vdso.c               | 4 ----
>   tools/testing/selftests/x86/test_vsyscall.c                   | 3 ---
>   tools/testing/selftests/x86/unwind_vdso.c                     | 3 ---
>   tools/testing/selftests/x86/vdso_restorer.c                   | 3 ---
>   218 files changed, 20 insertions(+), 426 deletions(-)
> 
> --
> 2.45.0.rc1.225.g2a3ae87e7f-goog
> 
> 

thanks,
-- Shuah

