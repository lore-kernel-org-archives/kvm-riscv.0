From: Xiaoyao Li <xiaoyao.li@intel.com>
Date: Fri, 10 Nov 2023 16:49:21 +0800
Subject: [PATCH 16/34] KVM: x86: "Reset" vcpu->run->exit_reason early in
 KVM_RUN
In-Reply-To: <20231105163040.14904-17-pbonzini@redhat.com>
References: <20231105163040.14904-1-pbonzini@redhat.com>
 <20231105163040.14904-17-pbonzini@redhat.com>
Message-ID: <b4ec10ab-9d06-4784-8893-6e2e895cd9b1@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/6/2023 12:30 AM, Paolo Bonzini wrote:
> From: Sean Christopherson <seanjc@google.com>
> 
> Initialize run->exit_reason to KVM_EXIT_UNKNOWN early in KVM_RUN to reduce
> the probability of exiting to userspace with a stale run->exit_reason that
> *appears* to be valid.
> 
> To support fd-based guest memory (guest memory without a corresponding
> userspace virtual address), KVM will exit to userspace for various memory
> related errors, which userspace *may* be able to resolve, instead of using
> e.g. BUS_MCEERR_AR.  And in the more distant future, KVM will also likely
> utilize the same functionality to let userspace "intercept" and handle
> memory faults when the userspace mapping is missing, i.e. when fast gup()
> fails.
> 
> Because many of KVM's internal APIs related to guest memory use '0' to
> indicate "success, continue on" and not "exit to userspace", reporting
> memory faults/errors to userspace will set run->exit_reason and
> corresponding fields in the run structure fields in conjunction with a
> a non-zero, negative return code, e.g. -EFAULT or -EHWPOISON.  And because
> KVM already returns  -EFAULT in many paths, there's a relatively high
> probability that KVM could return -EFAULT without setting run->exit_reason,
> in which case reporting KVM_EXIT_UNKNOWN is much better than reporting
> whatever exit reason happened to be in the run structure.
> 
> Note, KVM must wait until after run->immediate_exit is serviced to
> sanitize run->exit_reason as KVM's ABI is that run->exit_reason is
> preserved across KVM_RUN when run->immediate_exit is true.
> 
> Link: https://lore.kernel.org/all/20230908222905.1321305-1-amoorthy at google.com
> Link: https://lore.kernel.org/all/ZFFbwOXZ5uI%2Fgdaf at google.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Tested-by: Fuad Tabba <tabba@google.com>
> Message-Id: <20231027182217.3615211-19-seanjc@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

> ---
>   arch/x86/kvm/x86.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 8f9d8939b63b..f661acb01c58 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -11082,6 +11082,7 @@ static int vcpu_run(struct kvm_vcpu *vcpu)
>   {
>   	int r;
>   
> +	vcpu->run->exit_reason = KVM_EXIT_UNKNOWN;
>   	vcpu->arch.l1tf_flush_l1d = true;
>   
>   	for (;;) {


