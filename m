From: Sean Christopherson <seanjc@google.com>
Date: Mon, 29 Nov 2021 18:55:14 +0000
Subject: [PATCH v2 11/43] KVM: Don't block+unblock when halt-polling is
 successful
In-Reply-To: <496c2fc6-26b0-9b5d-32f4-2f9e9dd6a064@redhat.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-12-seanjc@google.com>
 <cceb33be9e2a6ac504bb95a7b2b8cf5fe0b1ff26.camel@redhat.com>
 <4e883728e3e5201a94eb46b56315afca5e95ad9c.camel@redhat.com>
 <YaUNBfJh35WXMV0M@google.com>
 <496c2fc6-26b0-9b5d-32f4-2f9e9dd6a064@redhat.com>
Message-ID: <YaUiEquKYi5eqWC0@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 29, 2021, Paolo Bonzini wrote:
> On 11/29/21 18:25, Sean Christopherson wrote:
> > If a posted interrupt arrives after KVM has done its final search through the vIRR,
> > but before avic_update_iommu_vcpu_affinity() is called, the posted interrupt will
> > be set in the vIRR without triggering a host IRQ to wake the vCPU via the GA log.
> > 
> > I.e. KVM is missing an equivalent to VMX's posted interrupt check for an outstanding
> > notification after switching to the wakeup vector.
> 
> BTW Maxim reported that it can break even without assigned devices.
> 
> > For now, the least awful approach is sadly to keep the vcpu_(un)blocking() hooks.
> 
> I agree that the hooks cannot be dropped but the bug is reproducible with
> this patch, where the hooks are still there.

...

> Still it does seem to be a race that happens when IS_RUNNING=true but
> vcpu->mode == OUTSIDE_GUEST_MODE.  This patch makes the race easier to
> trigger because it moves IS_RUNNING=false later.

Oh!  Any chance the bug only repros with preemption enabled?  That would explain
why I don't see problems, I'm pretty sure I've only run AVIC with a PREEMPT=n.

svm_vcpu_{un}blocking() are called with preemption enabled, and avic_set_running()
passes in vcpu->cpu.  If the vCPU is preempted and scheduled in on a different CPU,
avic_vcpu_load() will overwrite the vCPU's entry with the wrong CPU info.

