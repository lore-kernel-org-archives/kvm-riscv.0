From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 6 Sep 2023 10:15:23 +0800
Subject: [PATCH v2 1/8] KVM: selftests: Unify the codes for guest
 exception handling
In-Reply-To: <20230904-ba5051a5bf17d17f2711d7dc@orel>
References: <cover.1693659382.git.haibo1.xu@intel.com> <7affb0387d7272573f7093de7887872e1fb5979b.1693659382.git.haibo1.xu@intel.com>
 <20230904-ba5051a5bf17d17f2711d7dc@orel>
Message-ID: <CAJve8ok7xny2f+J_O0SFZRAiKGMinM9C1YK=OXVpABem=KttnQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 4, 2023 at 7:16?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Sat, Sep 02, 2023 at 08:59:23PM +0800, Haibo Xu wrote:
> > Rename the vm_init_descriptor_tables() and vcpu_init_vector_tables()
>                                              ^ vcpu_init_descriptor_tables()
>
> > prototypes to vm_init_vector_tables() and vcpu_init_vector_tables()
> > respectively, so that we can use common names for the architectures
> > (x86/aarch64/riscv) and then put them in a common header.
> >
> > By the way, vm_install_exception_handler() prototype were also moved to
> > the common header since they are commonly used across the architectures.
> >
> > The patch is a preparation to share the guest exception handling codes
> > in riscv.
> >
> > Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> > Suggested-by: Sean Christopherson <seanjc@google.com>
> > Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> > ---
> >  tools/testing/selftests/kvm/aarch64/arch_timer.c          | 4 ++--
> >  tools/testing/selftests/kvm/aarch64/debug-exceptions.c    | 4 ++--
> >  tools/testing/selftests/kvm/aarch64/page_fault_test.c     | 4 ++--
> >  tools/testing/selftests/kvm/aarch64/vgic_irq.c            | 4 ++--
> >  tools/testing/selftests/kvm/include/aarch64/processor.h   | 8 +-------
> >  tools/testing/selftests/kvm/include/kvm_util_base.h       | 7 +++++++
> >  tools/testing/selftests/kvm/include/x86_64/processor.h    | 5 -----
> >  tools/testing/selftests/kvm/lib/aarch64/processor.c       | 6 +++---
> >  tools/testing/selftests/kvm/lib/x86_64/processor.c        | 4 ++--
> >  tools/testing/selftests/kvm/x86_64/amx_test.c             | 4 ++--
> >  tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c   | 4 ++--
> >  tools/testing/selftests/kvm/x86_64/hyperv_evmcs.c         | 4 ++--
> >  tools/testing/selftests/kvm/x86_64/hyperv_features.c      | 8 ++++----
> >  tools/testing/selftests/kvm/x86_64/hyperv_ipi.c           | 6 +++---
> >  tools/testing/selftests/kvm/x86_64/kvm_pv_test.c          | 4 ++--
> >  tools/testing/selftests/kvm/x86_64/monitor_mwait_test.c   | 4 ++--
> >  .../testing/selftests/kvm/x86_64/pmu_event_filter_test.c  | 8 ++++----
> >  .../kvm/x86_64/smaller_maxphyaddr_emulation_test.c        | 4 ++--
> >  tools/testing/selftests/kvm/x86_64/svm_int_ctl_test.c     | 4 ++--
> >  .../selftests/kvm/x86_64/svm_nested_shutdown_test.c       | 4 ++--
> >  .../selftests/kvm/x86_64/svm_nested_soft_inject_test.c    | 4 ++--
> >  tools/testing/selftests/kvm/x86_64/ucna_injection_test.c  | 8 ++++----
> >  .../selftests/kvm/x86_64/userspace_msr_exit_test.c        | 4 ++--
> >  .../kvm/x86_64/vmx_exception_with_invalid_guest_state.c   | 4 ++--
> >  tools/testing/selftests/kvm/x86_64/vmx_pmu_caps_test.c    | 4 ++--
> >  tools/testing/selftests/kvm/x86_64/xapic_ipi_test.c       | 4 ++--
> >  tools/testing/selftests/kvm/x86_64/xcr0_cpuid_test.c      | 4 ++--
> >  tools/testing/selftests/kvm/x86_64/xen_shinfo_test.c      | 4 ++--
> >  28 files changed, 66 insertions(+), 70 deletions(-)
> >
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks for the review!

