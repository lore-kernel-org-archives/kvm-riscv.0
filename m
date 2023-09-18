From: Claudio Imbrenda <imbrenda@linux.ibm.com>
Date: Mon, 18 Sep 2023 15:38:35 +0200
Subject: [PATCH 10/26] KVM: s390: Stop selecting and depending on
 HAVE_KVM
In-Reply-To: <20230916003118.2540661-11-seanjc@google.com>
References: <20230916003118.2540661-1-seanjc@google.com>
	<20230916003118.2540661-11-seanjc@google.com>
Message-ID: <20230918153835.3303b94c@p-imbrenda>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 15 Sep 2023 17:31:02 -0700
Sean Christopherson <seanjc@google.com> wrote:

> Now that nothing in s390 or architecture agnostic code consumes HAVE_KVM,
> stop selecting it in s390.  This is one of several steps towards deleting
> HAVE_KVM from the common KVM Kconfig.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/s390/Kconfig     | 1 -
>  arch/s390/kvm/Kconfig | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index ae29e4392664..8a5dca0036d9 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -193,7 +193,6 @@ config S390
>  	select HAVE_KPROBES
>  	select HAVE_KPROBES_ON_FTRACE
>  	select HAVE_KRETPROBES
> -	select HAVE_KVM
>  	select HAVE_LIVEPATCH
>  	select HAVE_MEMBLOCK_PHYS_MAP
>  	select HAVE_MOD_ARCH_SPECIFIC
> diff --git a/arch/s390/kvm/Kconfig b/arch/s390/kvm/Kconfig
> index 459d536116a6..9056cee72945 100644
> --- a/arch/s390/kvm/Kconfig
> +++ b/arch/s390/kvm/Kconfig
> @@ -19,7 +19,6 @@ if VIRTUALIZATION
>  config KVM
>  	def_tristate y
>  	prompt "Kernel-based Virtual Machine (KVM) support"
> -	depends on HAVE_KVM
>  	select PREEMPT_NOTIFIERS
>  	select HAVE_KVM_CPU_RELAX_INTERCEPT
>  	select HAVE_KVM_VCPU_ASYNC_IOCTL

it looks like we don't use HAVE_KVM on s390x

Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>

