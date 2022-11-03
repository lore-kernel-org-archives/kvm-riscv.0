From: Isaku Yamahata <isaku.yamahata@gmail.com>
Date: Thu, 3 Nov 2022 14:04:02 -0700
Subject: [PATCH 36/44] KVM: x86: Do compatibility checks when onlining CPU
In-Reply-To: <20221102231911.3107438-37-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-37-seanjc@google.com>
Message-ID: <20221103210402.GB1063309@ls.amr.corp.intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 02, 2022 at 11:19:03PM +0000,
Sean Christopherson <seanjc@google.com> wrote:

> From: Chao Gao <chao.gao@intel.com>
> 
> Do compatibility checks when enabling hardware to effectively add
> compatibility checks when onlining a CPU.  Abort enabling, i.e. the
> online process, if the (hotplugged) CPU is incompatible with the known
> good setup.
> 
> At init time, KVM does compatibility checks to ensure that all online
> CPUs support hardware virtualization and a common set of features. But
> KVM uses hotplugged CPUs without such compatibility checks. On Intel
> CPUs, this leads to #GP if the hotplugged CPU doesn't support VMX, or
> VM-Entry failure if the hotplugged CPU doesn't support all features
> enabled by KVM.
> 
> Note, this is little more than a NOP on SVM, as SVM already checks for
> full SVM support during hardware enabling.
> 
> Opportunistically add a pr_err() if setup_vmcs_config() fails, and
> tweak all error messages to output which CPU failed.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/include/asm/kvm_host.h |  2 +-
>  arch/x86/kvm/svm/svm.c          | 20 +++++++++++---------
>  arch/x86/kvm/vmx/vmx.c          | 33 +++++++++++++++++++--------------
>  arch/x86/kvm/x86.c              |  5 +++--
>  4 files changed, 34 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index f223c845ed6e..c99222b71fcc 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1666,7 +1666,7 @@ struct kvm_x86_nested_ops {
>  };
>  
>  struct kvm_x86_init_ops {
> -	int (*check_processor_compatibility)(void);
> +	int (*check_processor_compatibility)(int cpu);

Is this cpu argument used only for error message to include cpu number
with avoiding repeating raw_smp_processor_id() in pr_err()?
The actual check is done on the current executing cpu.

If cpu != raw_smp_processor_id(), cpu is wrong. Although the function is called
in non-preemptive context, it's a bit confusing. So voting to remove it and
to use.

Thanks,
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

