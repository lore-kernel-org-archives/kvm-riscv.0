From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 25 Oct 2021 16:01:42 +0200
Subject: [PATCH v2 24/43] KVM: VMX: Drop pointless PI.NDST update when
 blocking
In-Reply-To: <20211009021236.4122790-25-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-25-seanjc@google.com>
Message-ID: <18e6a656-f583-0ad4-6770-9678be3f5cf4@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 09/10/21 04:12, Sean Christopherson wrote:
> Don't update Posted Interrupt's NDST, a.k.a. the target pCPU, in the
> pre-block path, as NDST is guaranteed to be up-to-date.  The comment
> about the vCPU being preempted during the update is simply wrong, as the
> update path runs with IRQs disabled (from before snapshotting vcpu->cpu,
> until after the update completes).

Right, it didn't as of commit bf9f6ac8d74969690df1485b33b7c238ca9f2269 
(when VT-d posted interrupts were introduced).

The interrupt disable/enable pair was added in the same commit that 
motivated the introduction of the sanity checks:

     commit 8b306e2f3c41939ea528e6174c88cfbfff893ce1
     Author: Paolo Bonzini <pbonzini@redhat.com>
     Date:   Tue Jun 6 12:57:05 2017 +0200

     KVM: VMX: avoid double list add with VT-d posted interrupts

     In some cases, for example involving hot-unplug of assigned
     devices, pi_post_block can forget to remove the vCPU from the
     blocked_vcpu_list.  When this happens, the next call to
     pi_pre_block corrupts the list.

     Fix this in two ways.  First, check vcpu->pre_pcpu in pi_pre_block
     and WARN instead of adding the element twice in the list.  Second,
     always do the list removal in pi_post_block if vcpu->pre_pcpu is
     set (not -1).

     The new code keeps interrupts disabled for the whole duration of
     pi_pre_block/pi_post_block.  This is not strictly necessary, but
     easier to follow.  For the same reason, PI.ON is checked only
     after the cmpxchg, and to handle it we just call the post-block
     code.  This removes duplication of the list removal code.

At the time, I didn't notice the now useless NDST update.

Paolo

> The vCPU can get preempted_before_  the update starts, but not during.
> And if the vCPU is preempted before, vmx_vcpu_pi_load() is responsible
> for updating NDST when the vCPU is scheduled back in.  In that case, the
> check against the wakeup vector in vmx_vcpu_pi_load() cannot be true as
> that would require the notification vector to have been set to the wakeup
> vector_before_  blocking.
> 
> Opportunistically switch to using vcpu->cpu for the list/lock lookups,
> which presumably used pre_pcpu only for some phantom preemption logic.


