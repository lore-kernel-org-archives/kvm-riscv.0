From: Haibo Xu <xiaobo55x@gmail.com>
Date: Tue, 19 Dec 2023 10:28:31 +0800
Subject: [PATCH v4 08/11] KVM: riscv: selftests: Add guest helper to get
 vcpu id
In-Reply-To: <20231213-b02db86aaf7957be22b200f1@orel>
References: <cover.1702371136.git.haibo1.xu@intel.com> <02f6c9ccaaeb4ceb67137863e0317f62cef62496.1702371136.git.haibo1.xu@intel.com>
 <20231213-b02db86aaf7957be22b200f1@orel>
Message-ID: <CAJve8okOO=e66Kko3LyDfsD+tRZvDGf_Zgmog-u5TUzk1JZ1RA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 13, 2023 at 10:08?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Tue, Dec 12, 2023 at 05:31:17PM +0800, Haibo Xu wrote:
> > Add guest_get_vcpuid() helper to simplify accessing to per-cpu
> > private data. The sscratch CSR was used to store the vcpu id.
> >
> > Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  tools/testing/selftests/kvm/include/aarch64/processor.h | 4 ----
> >  tools/testing/selftests/kvm/include/kvm_util_base.h     | 9 +++++++++
> >  tools/testing/selftests/kvm/lib/riscv/processor.c       | 8 ++++++++
> >  3 files changed, 17 insertions(+), 4 deletions(-)
> >
> > diff --git a/tools/testing/selftests/kvm/include/aarch64/processor.h b/tools/testing/selftests/kvm/include/aarch64/processor.h
> > index c42d683102c7..16ae0ac01879 100644
> > --- a/tools/testing/selftests/kvm/include/aarch64/processor.h
> > +++ b/tools/testing/selftests/kvm/include/aarch64/processor.h
> > @@ -226,8 +226,4 @@ void smccc_smc(uint32_t function_id, uint64_t arg0, uint64_t arg1,
> >              uint64_t arg2, uint64_t arg3, uint64_t arg4, uint64_t arg5,
> >              uint64_t arg6, struct arm_smccc_res *res);
> >
> > -
> > -
> > -uint32_t guest_get_vcpuid(void);
> > -
> >  #endif /* SELFTEST_KVM_PROCESSOR_H */
> > diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
> > index a18db6a7b3cf..666438113d22 100644
> > --- a/tools/testing/selftests/kvm/include/kvm_util_base.h
> > +++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
> > @@ -932,4 +932,13 @@ void kvm_selftest_arch_init(void);
> >
> >  void kvm_arch_vm_post_create(struct kvm_vm *vm);
> >
> > +void vm_init_vector_tables(struct kvm_vm *vm);
> > +void vcpu_init_vector_tables(struct kvm_vcpu *vcpu);
> > +
> > +struct ex_regs;
> > +typedef void(*exception_handler_fn)(struct ex_regs *);
> > +void vm_install_exception_handler(struct kvm_vm *vm, int vector, exception_handler_fn handler);
>
> I think something happend on rebase since the above should be in a
> different patch (and were for v3). I suggest checking your previous
> and current version branches with git-range-diff after rebasing in
> order to catch stuff like this.
>
> Thanks,
> drew
>

Thanks for pointing it out. Will fix it in v5.

> > +
> > +uint32_t guest_get_vcpuid(void);
> > +
> >  #endif /* SELFTEST_KVM_UTIL_BASE_H */
> > diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
> > index efd9ac4b0198..39a1e9902dec 100644
> > --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> > +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> > @@ -316,6 +316,9 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id,
> >       vcpu_set_reg(vcpu, RISCV_CORE_REG(regs.sp), stack_vaddr + stack_size);
> >       vcpu_set_reg(vcpu, RISCV_CORE_REG(regs.pc), (unsigned long)guest_code);
> >
> > +     /* Setup sscratch for guest_get_vcpuid() */
> > +     vcpu_set_reg(vcpu, RISCV_CSR_REG(sscratch), vcpu_id);
> > +
> >       /* Setup default exception vector of guest */
> >       vcpu_set_reg(vcpu, RISCV_CSR_REG(stvec), (unsigned long)guest_unexp_trap);
> >
> > @@ -436,3 +439,8 @@ void vm_install_interrupt_handler(struct kvm_vm *vm, exception_handler_fn handle
> >
> >       handlers->exception_handlers[1][0] = handler;
> >  }
> > +
> > +uint32_t guest_get_vcpuid(void)
> > +{
> > +     return csr_read(CSR_SSCRATCH);
> > +}
> > --
> > 2.34.1
> >

