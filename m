From: Oliver Upton <oupton@google.com>
Date: Tue, 22 Mar 2022 06:52:35 +0000
Subject: [PATCH v4 07/15] KVM: Create helper for setting a system event
 exit
In-Reply-To: <CAAhSdy3mH5JQ9N9JzbUpBw3ZdqKtLretsUKL3WAdMhpEXVmJRg@mail.gmail.com>
References: <20220311174001.605719-1-oupton@google.com>
 <20220311174001.605719-8-oupton@google.com>
 <CAAhSdy3mH5JQ9N9JzbUpBw3ZdqKtLretsUKL3WAdMhpEXVmJRg@mail.gmail.com>
Message-ID: <YjlyM6/WFMB4JnHF@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 19, 2022 at 12:58:28PM +0530, Anup Patel wrote:
> On Fri, Mar 11, 2022 at 11:11 PM Oliver Upton <oupton@google.com> wrote:
> >
> > Create a helper that appropriately configures kvm_run for a system event
> > exit.
> >
> > No functional change intended.
> >
> > Suggested-by: Marc Zyngier <maz@kernel.org>
> > Signed-off-by: Oliver Upton <oupton@google.com>
> > Acked-by: Anup Patel <anup@brainfault.org>
> > ---
> >  arch/arm64/kvm/psci.c         | 5 +----
> >  arch/riscv/kvm/vcpu_sbi_v01.c | 4 +---
> >  arch/x86/kvm/x86.c            | 6 ++----
> >  include/linux/kvm_host.h      | 2 ++
> >  virt/kvm/kvm_main.c           | 8 ++++++++
> >  5 files changed, 14 insertions(+), 11 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
> > index efd4428fda1c..78266716165e 100644
> > --- a/arch/arm64/kvm/psci.c
> > +++ b/arch/arm64/kvm/psci.c
> > @@ -173,10 +173,7 @@ static void kvm_prepare_system_event(struct kvm_vcpu *vcpu, u32 type, u64 flags)
> >                 tmp->arch.mp_state.mp_state = KVM_MP_STATE_STOPPED;
> >         kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
> >
> > -       memset(&vcpu->run->system_event, 0, sizeof(vcpu->run->system_event));
> > -       vcpu->run->system_event.type = type;
> > -       vcpu->run->system_event.flags = flags;
> > -       vcpu->run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
> > +       kvm_vcpu_set_system_event_exit(vcpu, type, flags);
> >  }
> >
> >  static void kvm_psci_system_off(struct kvm_vcpu *vcpu)
> > diff --git a/arch/riscv/kvm/vcpu_sbi_v01.c b/arch/riscv/kvm/vcpu_sbi_v01.c
> > index 07e2de14433a..c5581008dd88 100644
> > --- a/arch/riscv/kvm/vcpu_sbi_v01.c
> > +++ b/arch/riscv/kvm/vcpu_sbi_v01.c
> > @@ -24,9 +24,7 @@ static void kvm_sbi_system_shutdown(struct kvm_vcpu *vcpu,
> >                 tmp->arch.power_off = true;
> >         kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
> >
> > -       memset(&run->system_event, 0, sizeof(run->system_event));
> > -       run->system_event.type = type;
> > -       run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
> > +       kvm_vcpu_set_system_event_exit(vcpu, type, 0);
> 
> This patch needs to be rebased on the latest kvm/next because we have
> done some refactoring to support SBI v0.3 SRST extension.

Sure thing, I've already picked up some fixes anyhow so not a problem.
Thank you for letting me know directly about the conflict though :)

--
Thanks,
Oliver

