From: Marc Zyngier <maz@kernel.org>
Date: Thu, 24 Feb 2022 15:40:15 +0000
Subject: [PATCH v3 13/19] KVM: arm64: Add support KVM_SYSTEM_EVENT_SUSPEND
 to PSCI SYSTEM_SUSPEND
In-Reply-To: <20220223041844.3984439-14-oupton@google.com>
References: <20220223041844.3984439-1-oupton@google.com>
 <20220223041844.3984439-14-oupton@google.com>
Message-ID: <87sfs82rz4.wl-maz@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 23 Feb 2022 04:18:38 +0000,
Oliver Upton <oupton@google.com> wrote:
> 
> Add a new system event type, KVM_SYSTEM_EVENT_SUSPEND, which indicates
> to userspace that the guest has requested the VM be suspended. Userspace
> can decide whether or not it wants to honor the guest's request by
> changing the MP state of the vCPU. If it does not, userspace is
> responsible for configuring the vCPU to return an error to the guest.
> Document these expectations in the KVM API documentation.
> 
> To preserve ABI, this new exit requires explicit opt-in from userspace.
> Add KVM_CAP_ARM_SYSTEM_SUSPEND which grants userspace the ability to
> opt-in to these exits on a per-VM basis.
> 
> Signed-off-by: Oliver Upton <oupton@google.com>
> ---
>  Documentation/virt/kvm/api.rst    | 39 +++++++++++++++++++++++++++++++
>  arch/arm64/include/asm/kvm_host.h |  3 +++
>  arch/arm64/kvm/arm.c              |  5 ++++
>  arch/arm64/kvm/psci.c             |  5 ++++
>  include/uapi/linux/kvm.h          |  2 ++
>  5 files changed, 54 insertions(+)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 2b4bdbc2dcc0..1e207bbc01f5 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -5930,6 +5930,7 @@ should put the acknowledged interrupt vector into the 'epr' field.
>    #define KVM_SYSTEM_EVENT_RESET          2
>    #define KVM_SYSTEM_EVENT_CRASH          3
>    #define KVM_SYSTEM_EVENT_WAKEUP         4
> +  #define KVM_SYSTEM_EVENT_SUSPENDED      5
>  			__u32 type;
>  			__u64 flags;
>  		} system_event;
> @@ -5957,6 +5958,34 @@ Valid values for 'type' are:
>   - KVM_SYSTEM_EVENT_WAKEUP -- the guest is in a suspended state and KVM
>     has recognized a wakeup event. Userspace may honor this event by marking
>     the exiting vCPU as runnable, or deny it and call KVM_RUN again.
> + - KVM_SYSTEM_EVENT_SUSPENDED -- the guest has requested a suspension of
> +   the VM.
> +
> +For arm/arm64:
> +^^^^^^^^^^^^^^
> +
> +   KVM_SYSTEM_EVENT_SUSPENDED exits are enabled with the
> +   KVM_CAP_ARM_SYSTEM_SUSPEND VM capability. If a guest successfully
> +   invokes the PSCI SYSTEM_SUSPEND function, KVM will exit to userspace
> +   with this event type.
> +
> +   The guest's x2 register contains the 'entry_address' where execution

x1?

> +   should resume when the VM is brought out of suspend. The guest's x3

x2?

> +   register contains the 'context_id' corresponding to the request. When
> +   the guest resumes execution at 'entry_address', x0 should contain the
> +   'context_id'. For more details on the SYSTEM_SUSPEND PSCI call, see
> +   ARM DEN0022D.b 5.19 "SYSTEM_SUSPEND".

I'd refrain from paraphrasing too much of the spec, and direct the
user to it. It will also avoid introducing bugs... ;-)

Overall, "the guest" is super ambiguous, and echoes the questions I
had earlier about what this means for an SMP system. Only one vcpu can
restart the system, but which one?

> +
> +   Userspace is _required_ to take action for such an exit. It must
> +   either:
> +
> +    - Honor the guest request to suspend the VM. Userspace must reset
> +      the calling vCPU, then set PC to 'entry_address' and x0 to
> +      'context_id'. Userspace may request in-kernel emulation of the
> +      suspension by setting the vCPU's state to KVM_MP_STATE_SUSPENDED.

So here, you are actively saying that the calling vcpu should be the
one being resumed. If that's the case (and assuming that this is a
behaviour intended by the spec), something should prevent the other
vcpus from being started.

> +
> +    - Deny the guest request to suspend the VM. Userspace must set
> +      registers x1-x3 to 0 and set x0 to PSCI_RET_INTERNAL_ERROR (-6).

Do you have any sort of userspace code that demonstrates this? It'd be
super useful to see how that works on any publicly available VMM
(qemu, kvmtool, or any of the ferric oxide based monsters).

>
>  ::
>  
> @@ -7580,3 +7609,13 @@ The argument to KVM_ENABLE_CAP is also a bitmask, and must be a subset
>  of the result of KVM_CHECK_EXTENSION.  KVM will forward to userspace
>  the hypercalls whose corresponding bit is in the argument, and return
>  ENOSYS for the others.
> +
> +8.35 KVM_CAP_ARM_SYSTEM_SUSPEND
> +-------------------------------
> +
> +:Capability: KVM_CAP_ARM_SYSTEM_SUSPEND
> +:Architectures: arm64
> +:Type: vm
> +
> +When enabled, KVM will exit to userspace with KVM_EXIT_SYSTEM_EVENT of
> +type KVM_SYSTEM_EVENT_SUSPEND to process the guest suspend request.
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index d32cab0c9752..e1c2ec18d1aa 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -146,6 +146,9 @@ struct kvm_arch {
>  
>  	/* Memory Tagging Extension enabled for the guest */
>  	bool mte_enabled;
> +
> +	/* System Suspend Event exits enabled for the VM */
> +	bool system_suspend_exits;

Gah... More of these. Please pick this patch:

https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?h=kvm-arm64/mmu/guest-MMIO-guard&id=7dd0a13a4217b870f2e83cdc6045e5ce482a5340

>  };
>  
>  struct kvm_vcpu_fault_info {
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index d2b190f32651..ce3f14a77a49 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -101,6 +101,10 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>  		}
>  		mutex_unlock(&kvm->lock);
>  		break;
> +	case KVM_CAP_ARM_SYSTEM_SUSPEND:
> +		r = 0;
> +		kvm->arch.system_suspend_exits = true;
> +		break;
>  	default:
>  		r = -EINVAL;
>  		break;
> @@ -209,6 +213,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  	case KVM_CAP_SET_GUEST_DEBUG:
>  	case KVM_CAP_VCPU_ATTRIBUTES:
>  	case KVM_CAP_PTP_KVM:
> +	case KVM_CAP_ARM_SYSTEM_SUSPEND:
>  		r = 1;
>  		break;
>  	case KVM_CAP_SET_GUEST_DEBUG2:
> diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
> index 2bb8d047cde4..a7de84cec2e4 100644
> --- a/arch/arm64/kvm/psci.c
> +++ b/arch/arm64/kvm/psci.c
> @@ -245,6 +245,11 @@ static int kvm_psci_system_suspend(struct kvm_vcpu *vcpu)
>  		return 1;
>  	}
>  
> +	if (kvm->arch.system_suspend_exits) {
> +		kvm_vcpu_set_system_event_exit(vcpu, KVM_SYSTEM_EVENT_SUSPEND);
> +		return 0;
> +	}
> +

So there really is a difference in behaviour here. Userspace sees the
WFI behaviour before reset (it implements it), while when not using
the SUSPEND event, reset occurs before anything else.

They really should behave in a similar way (WFI first, reset next).

>  	__kvm_reset_vcpu(vcpu, &reset_state);
>  	kvm_vcpu_wfi(vcpu);
>  	return 1;
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index babb16c2abe5..e5bb5f15c0eb 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -445,6 +445,7 @@ struct kvm_run {
>  #define KVM_SYSTEM_EVENT_RESET          2
>  #define KVM_SYSTEM_EVENT_CRASH          3
>  #define KVM_SYSTEM_EVENT_WAKEUP         4
> +#define KVM_SYSTEM_EVENT_SUSPEND        5
>  			__u32 type;
>  			__u64 flags;
>  		} system_event;
> @@ -1136,6 +1137,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_VM_GPA_BITS 207
>  #define KVM_CAP_XSAVE2 208
>  #define KVM_CAP_SYS_ATTRIBUTES 209
> +#define KVM_CAP_ARM_SYSTEM_SUSPEND 210
>  
>  #ifdef KVM_CAP_IRQ_ROUTING

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

